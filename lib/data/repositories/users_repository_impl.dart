import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:github_user_explorer/data/datasource/users_datasource.dart';
import 'package:github_user_explorer/data/repositories/users_repository.dart';
import 'package:github_user_explorer/domain/model/profile_model.dart';
import 'package:github_user_explorer/domain/model/repository_model.dart';
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
      final errorMessage = e.response?.data?['message'] ?? 'An error occurred.';
      return Left(errorMessage);
    } catch (e) {
      return Left('There was an error, please try again.');
    }
  }

  @override
  Future<Either<String, ProfileModel>> getUser(int id) async {
    try {
      final profile = await _datasource.getUser(id);
      return Right(profile);
    } on DioException catch (e) {
      final errorMessage = e.response?.data?['message'] ?? 'An error occurred.';
      return Left(errorMessage);
    } catch (e) {
      return Left('There was an error, please try again.');
    }
  }

  @override
  Future<Either<String, List<RepositoryModel>>> getRepos(String login) async {
    try {
      final repos = await _datasource.getRepos(login);
      return Right(repos);
    } on DioException catch (e) {
      final errorMessage = e.response?.data?['message'] ?? 'An error occurred.';
      return Left(errorMessage);
    } catch (e) {
      return Left('There was an error, please try again.');
    }
  }
}
