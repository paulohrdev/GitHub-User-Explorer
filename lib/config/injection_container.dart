import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_explorer/data/datasource/users_datasource.dart';
import 'package:github_user_explorer/data/datasource/users_datasource_impl.dart';
import 'package:github_user_explorer/data/repositories/users_repository.dart';
import 'package:github_user_explorer/data/repositories/users_repository_impl.dart';

final sl = GetIt.instance;

void setupDependencies() {
  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL']!,
      headers: {'Accept': 'application/vnd.github+json'},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  sl.registerSingleton<Dio>(dio);

  sl.registerSingleton<UsersDatasource>(
    UsersDatasourceImpl(sl<Dio>()),
  );

  sl.registerSingleton<UsersRepository>(
    UsersRepositoryImpl(sl<UsersDatasource>()),
  );
}
