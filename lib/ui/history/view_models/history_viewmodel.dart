import 'package:github_user_explorer/data/repositories/history_repository.dart';
import 'package:github_user_explorer/domain/model/history_entry.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HistoryViewModel {
  HistoryViewModel({required this.historyRepository});

  final HistoryRepository historyRepository;

  final entries = signal<List<HistoryEntry>>([]);

  void loadHistory() {
    historyRepository.getAll().fold(
      (_) => entries.value = [],
      (data) => entries.value = data..sort((a, b) => b.visitedAt.compareTo(a.visitedAt)),
    );
  }
}
