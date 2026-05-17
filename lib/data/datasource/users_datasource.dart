import 'package:github_user_explorer/domain/model/user_model.dart';

abstract interface class UsersDatasource{
  Future<List<UserModel>> searchUsers(String query);
}