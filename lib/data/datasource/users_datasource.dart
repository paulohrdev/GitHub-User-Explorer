import 'package:github_user_explorer/domain/model/profile_model.dart';
import 'package:github_user_explorer/domain/model/repository_model.dart';
import 'package:github_user_explorer/domain/model/user_model.dart';

abstract interface class UsersDatasource{
  Future<List<UserModel>> searchUsers(String query);

  Future<ProfileModel> getUser(int id);

  Future<List<RepositoryModel>> getRepos(String login);
}