import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:github_user_explorer/config/injection_container.dart';
import 'package:github_user_explorer/data/services/hive_service.dart';
import 'package:github_user_explorer/routing/router.dart';
import 'package:github_user_explorer/ui/core/themes/theme.dart';
import 'package:signals_core/signals_core.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SignalsObserver.instance = null;
  await dotenv.load();
  await HiveService.init();
  await setupDependencies();
  await initializeDateFormatting('pt_BR', null);
  runApp(const GithubUserExplorerApp());
}

class GithubUserExplorerApp extends StatelessWidget {
  const GithubUserExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GH Explorer',
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.darkTheme, // @TODO light theme
      routerConfig: AppRouter.router,
    );
  }
}