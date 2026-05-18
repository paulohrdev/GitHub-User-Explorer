import 'package:flutter/foundation.dart';
import 'package:github_user_explorer/config/injection_container.dart';
import 'package:github_user_explorer/data/repositories/users_repository.dart';
import 'package:github_user_explorer/routing/routes.dart';
import 'package:github_user_explorer/ui/history/view_models/history_viewmodel.dart';
import 'package:github_user_explorer/ui/history/widgets/history_screen.dart';
import 'package:github_user_explorer/ui/profile/view_models/profile_viewmodel.dart';
import 'package:github_user_explorer/ui/profile/widgets/profile_screen.dart';
import 'package:github_user_explorer/ui/repository/view_models/repository_viewmodel.dart';
import 'package:github_user_explorer/ui/repository/widgets/repository_screen.dart';
import 'package:github_user_explorer/ui/search/view_models/search_viewmodel.dart';
import 'package:github_user_explorer/ui/search/widgets/search_screen.dart';
import 'package:github_user_explorer/ui/splash/widgets/splash_screen.dart';
import 'package:github_user_explorer/ui/tabs/widgets/tabs_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => SplashScreen(),
        routes: [
          ShellRoute(
            builder: (context, state, child) => TabsScreen(child: child),
            routes: [
              GoRoute(
                path: Routes.searchRelative,
                builder: (context, state) {
                  return SearchScreen(viewModel: sl<SearchViewModel>());
                },
              ),
              GoRoute(
                path: Routes.historyRelative,
                builder: (context, state) {
                  return HistoryScreen(viewModel: HistoryViewModel());
                }
              ),
            ]
          ),
          GoRoute(
            path: Routes.profileRelative,
            builder: (context, state) {
              return ProfileScreen(viewModel: sl<ProfileViewModel>(), id: 0);
            },
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return ProfileScreen(viewModel: sl<ProfileViewModel>(), id: id);
                }
              ),
            ]
          ),
          GoRoute(
            path: Routes.repositoryRelative,
            builder: (context, state) {
              return RepositoryScreen(viewModel: RepositoryViewModel());
            },
          ),
        ]
      ),
    ],
  );
}