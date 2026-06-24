import 'package:either_dart/either.dart';
import 'package:github_user_explorer/domain/model/history_entry.dart';

abstract interface class HistoryRepository {
  Either<String, List<HistoryEntry>> getAll();
  Future<Either<String, void>> save(HistoryEntry entry);
  Future<Either<String, void>> delete(int id);
  Future<Either<String, void>> clear();
}
