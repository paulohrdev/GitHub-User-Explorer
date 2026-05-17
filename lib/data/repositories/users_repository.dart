import 'package:either_dart/either.dart';
import 'package:github_user_explorer/domain/model/user_model.dart';

abstract interface class UsersRepository {
  Future<Either<String, List<UserModel>>> searchUsers(String query);
}
