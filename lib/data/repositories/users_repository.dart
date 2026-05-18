import 'package:either_dart/either.dart';
import 'package:github_user_explorer/domain/model/profile_model.dart';
import 'package:github_user_explorer/domain/model/repository_model.dart';
import 'package:github_user_explorer/domain/model/user_model.dart';

abstract interface class UsersRepository {
  Future<Either<String, List<UserModel>>> searchUsers(String query);

  Future<Either<String, ProfileModel>> getUser(int id);

  Future<Either<String, List<RepositoryModel>>> getRepos(String login, {required String direction});
}
