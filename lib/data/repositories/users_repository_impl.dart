import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:github_user_explorer/data/datasource/users_datasource.dart';
import 'package:github_user_explorer/data/repositories/users_repository.dart';
import 'package:github_user_explorer/domain/model/user_model.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._datasource);

  final UsersDatasource _datasource;

  @override
  Future<Either<String, List<UserModel>>> searchUsers(String query) async {
    try {
      final users = await _datasource.searchUsers(query);
      return Right(users);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(e.toString());
    }
  }

  String _mapDioError(DioException e) => switch (e.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.receiveTimeout ||
        DioExceptionType.sendTimeout =>
          'Timeout na conexão com o servidor',
        DioExceptionType.connectionError => 'Sem conexão com a internet',
        DioExceptionType.badResponse =>
          'Erro ${e.response?.statusCode}: ${e.response?.statusMessage}',
        _ => e.message ?? 'Erro desconhecido',
      };
}
