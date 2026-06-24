import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_user_explorer/domain/repositories/history_repository.dart';
import 'package:github_user_explorer/domain/model/history_entry.dart';
import 'package:github_user_explorer/ui/history/view_models/history_viewmodel.dart';
import 'package:mocktail/mocktail.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  late MockHistoryRepository mockRepo;
  late HistoryViewModel sut;

  setUp(() {
    mockRepo = MockHistoryRepository();
    sut = HistoryViewModel(historyRepository: mockRepo);
  });

  test('loadHistory ordena entradas pela data de visita mais recente primeiro', () {
    final older = HistoryEntry(
      id: 1,
      login: 'john',
      avatarUrl: '',
      htmlUrl: '',
      visitedAt: DateTime(2024, 1, 1),
    );
    final newer = HistoryEntry(
      id: 2,
      login: 'jane',
      avatarUrl: '',
      htmlUrl: '',
      visitedAt: DateTime(2024, 6, 1),
    );

    when(() => mockRepo.getAll()).thenReturn(Right([older, newer]));

    sut.loadHistory();

    expect(sut.entries.value.first.login, 'jane');
    expect(sut.entries.value.last.login, 'john');
  });

  test('loadHistory com erro mantém a lista vazia', () {
    when(() => mockRepo.getAll()).thenReturn(const Left('Erro ao carregar'));

    sut.loadHistory();

    expect(sut.entries.value, isEmpty);
  });
}
