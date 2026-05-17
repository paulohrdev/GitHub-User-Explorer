import 'package:flutter/foundation.dart';
import 'package:github_user_explorer/routing/routes.dart';
import 'package:github_user_explorer/ui/splash/widgets/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return SplashScreen();
        },
      ),
    ],
  );
}