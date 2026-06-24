import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:github_user_explorer/data/datasource/history_datasource.dart';
import 'package:github_user_explorer/data/datasource/users_datasource.dart';
import 'package:github_user_explorer/domain/repositories/history_repository.dart';
import 'package:github_user_explorer/data/repositories/history_repository_impl.dart';
import 'package:github_user_explorer/domain/repositories/users_repository.dart';
import 'package:github_user_explorer/data/repositories/users_repository_impl.dart';
import 'package:github_user_explorer/data/services/hive_service.dart';
import 'package:github_user_explorer/domain/model/history_entry.dart';
import 'package:github_user_explorer/ui/history/view_models/history_viewmodel.dart';
import 'package:github_user_explorer/ui/profile/view_models/profile_viewmodel.dart';
import 'package:github_user_explorer/ui/search/view_models/search_viewmodel.dart';
import 'package:hive_ce/hive.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL']!,
      headers: {'Accept': 'application/vnd.github+json'},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  sl.registerSingleton<Dio>(dio);

  sl.registerSingleton<Box<HistoryEntry>>(HiveService.historyBox);
  sl.registerSingleton<HistoryDatasource>(
    HistoryDatasourceImpl(sl<Box<HistoryEntry>>()),
  );
  sl.registerSingleton<HistoryRepository>(
    HistoryRepositoryImpl(sl<HistoryDatasource>()),
  );

  sl.registerSingleton<UsersDatasource>(
    UsersDatasourceImpl(sl<Dio>()),
  );

  sl.registerSingleton<UsersRepository>(
    UsersRepositoryImpl(sl<UsersDatasource>()),
  );

  sl.registerSingleton<SearchViewModel>(
    SearchViewModel(usersRepository: sl<UsersRepository>()),
  );

  sl.registerSingleton<ProfileViewModel>(
    ProfileViewModel(
      usersRepository: sl<UsersRepository>(),
      historyRepository: sl<HistoryRepository>(),
    ),
  );

  sl.registerSingleton<HistoryViewModel>(
    HistoryViewModel(historyRepository: sl<HistoryRepository>()),
  );
}
