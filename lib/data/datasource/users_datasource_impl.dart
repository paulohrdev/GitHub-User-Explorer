import 'package:dio/dio.dart';
import 'package:github_user_explorer/data/datasource/users_datasource.dart';
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
}
