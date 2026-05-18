import 'package:github_user_explorer/domain/model/history_entry.dart';

abstract interface class HistoryDatasource {
  List<HistoryEntry> getAll();
  Future<void> save(HistoryEntry entry);
  Future<void> delete(int id);
  Future<void> clear();
}
