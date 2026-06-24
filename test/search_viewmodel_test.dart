import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_user_explorer/domain/repositories/users_repository.dart';
import 'package:github_user_explorer/domain/model/user_model.dart';
import 'package:github_user_explorer/ui/search/view_models/search_viewmodel.dart';
import 'package:mocktail/mocktail.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

void main() {
  late MockUsersRepository mockRepo;
  late SearchViewModel sut;

  setUp(() {
    mockRepo = MockUsersRepository();
    sut = SearchViewModel(usersRepository: mockRepo);
  });

  test('busca vazia não chama o repositório e mantém lista vazia', () async {
    sut.search('');
    await Future.delayed(const Duration(milliseconds: 800));

    verifyNever(() => mockRepo.searchUsers(any(), page: any(named: 'page')));
    expect(sut.users.value, isEmpty);
  });

  test('busca válida popula a lista e finaliza o loading', () async {
    final users = [
      UserModel(id: 1, login: 'john', avatarUrl: 'https://avatar.url', htmlUrl: 'https://github.com/john'),
    ];
    when(() => mockRepo.searchUsers('john', page: 1))
        .thenAnswer((_) async => Right(users));

    sut.search('john');
    await Future.delayed(const Duration(milliseconds: 800));

    expect(sut.users.value, equals(users));
    expect(sut.isLoading.value, isFalse);
  });
}
