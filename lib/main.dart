import 'package:flutter/material.dart';
import 'package:github_user_explorer/routing/router.dart';
import 'package:github_user_explorer/ui/core/themes/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GithubUserExplorerApp());
}

class GithubUserExplorerApp extends StatelessWidget {
  const GithubUserExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DynBook',
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.darkTheme, // @TODO light theme
      routerConfig: AppRouter.router,
    );
  }
}