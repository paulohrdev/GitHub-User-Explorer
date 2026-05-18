import 'package:dio/dio.dart';
import 'package:github_user_explorer/data/datasource/users_datasource.dart';
import 'package:github_user_explorer/domain/model/profile_model.dart';
import 'package:github_user_explorer/domain/model/repository_model.dart';
import 'package:github_user_explorer/domain/model/user_model.dart';

class UsersDatasourceImpl implements UsersDatasource {
  UsersDatasourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<UserModel>> searchUsers(String query) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/search/users',
      queryParameters: {'q': query, 'per_page': 20, 'page': 1},
    );

    final items = response.data!['items'] as List<dynamic>;
    return items
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<ProfileModel> getUser(int id) async {
    final response = await _dio.get<Map<String, dynamic>>('/user/$id');
    return ProfileModel.fromJson(response.data!);
  }

  @override
  Future<List<RepositoryModel>> getRepos(String login, {required String direction}) async {
    final response = await _dio.get<List<dynamic>>(
      '/users/$login/repos',
      queryParameters: {
        'sort': 'pushed',
        'direction': direction,
      },
    );

    final items = response.data!;
    return items
        .map((e) => RepositoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
