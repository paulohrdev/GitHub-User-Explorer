import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_user_explorer/domain/repositories/history_repository.dart';
import 'package:github_user_explorer/domain/repositories/users_repository.dart';
import 'package:github_user_explorer/domain/model/history_entry.dart';
import 'package:github_user_explorer/domain/model/profile_model.dart';
import 'package:github_user_explorer/domain/model/repository_model.dart';
import 'package:github_user_explorer/ui/profile/view_models/profile_viewmodel.dart';
import 'package:mocktail/mocktail.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  late MockUsersRepository mockUsersRepo;
  late MockHistoryRepository mockHistoryRepo;
  late ProfileViewModel sut;

  final profile = ProfileModel(
    id: 1,
    login: 'john',
    followers: 10,
    following: 5,
    repos: 3,
    avatarUrl: 'https://avatar.url',
    htmlUrl: 'https://github.com/john',
  );

  setUpAll(() {
    registerFallbackValue(HistoryEntry(
      id: 0,
      login: '',
      avatarUrl: '',
      htmlUrl: '',
      visitedAt: DateTime(2024),
    ));
  });

  setUp(() {
    mockUsersRepo = MockUsersRepository();
    mockHistoryRepo = MockHistoryRepository();
    sut = ProfileViewModel(
      usersRepository: mockUsersRepo,
      historyRepository: mockHistoryRepo,
    );

    when(() => mockUsersRepo.getRepos(any(), direction: any(named: 'direction')))
        .thenAnswer((_) async => Right(<RepositoryModel>[]));
    when(() => mockHistoryRepo.save(any()))
        .thenAnswer((_) async => const Right(null));
  });

  test('loadUser com sucesso define o perfil e salva no histórico', () async {
    when(() => mockUsersRepo.getUser(1))
        .thenAnswer((_) async => Right(profile));

    await sut.loadUser(1);

    expect(sut.profile.value, equals(profile));
    expect(sut.isLoading.value, isFalse);
    verify(() => mockHistoryRepo.save(any())).called(1);
  });

  test('loadUser com erro define a mensagem de erro e não salva histórico', () async {
    when(() => mockUsersRepo.getUser(1))
        .thenAnswer((_) async => const Left('Usuário não encontrado'));

    await sut.loadUser(1);

    expect(sut.errorMessage.value, 'Usuário não encontrado');
    expect(sut.profile.value, isNull);
    verifyNever(() => mockHistoryRepo.save(any()));
  });
}
