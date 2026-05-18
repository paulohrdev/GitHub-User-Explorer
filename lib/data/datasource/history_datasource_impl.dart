import 'package:github_user_explorer/data/datasource/history_datasource.dart';
import 'package:github_user_explorer/domain/model/history_entry.dart';
import 'package:hive_ce/hive.dart';

class HistoryDatasourceImpl implements HistoryDatasource {
  HistoryDatasourceImpl(this._box);

  final Box<HistoryEntry> _box;

  @override
  List<HistoryEntry> getAll() => _box.values.toList();

  @override
  Future<void> save(HistoryEntry entry) => _box.put(entry.id, entry);

  @override
  Future<void> delete(int id) => _box.delete(id);

  @override
  Future<void> clear() async => await _box.clear();
}
