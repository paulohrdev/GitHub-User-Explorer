import 'package:either_dart/either.dart';
import 'package:github_user_explorer/data/datasource/history_datasource.dart';
import 'package:github_user_explorer/domain/repositories/history_repository.dart';
import 'package:github_user_explorer/domain/model/history_entry.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl(this._datasource);

  final HistoryDatasource _datasource;

  @override
  Either<String, List<HistoryEntry>> getAll() {
    try {
      return Right(_datasource.getAll());
    } catch (_) {
      return const Left('Failed to load history.');
    }
  }

  @override
  Future<Either<String, void>> save(HistoryEntry entry) async {
    try {
      await _datasource.save(entry);
      return const Right(null);
    } catch (_) {
      return const Left('Failed to save entry.');
    }
  }

  @override
  Future<Either<String, void>> delete(int id) async {
    try {
      await _datasource.delete(id);
      return const Right(null);
    } catch (_) {
      return const Left('Failed to delete entry.');
    }
  }

  @override
  Future<Either<String, void>> clear() async {
    try {
      await _datasource.clear();
      return const Right(null);
    } catch (_) {
      return const Left('Failed to clear history.');
    }
  }
}
