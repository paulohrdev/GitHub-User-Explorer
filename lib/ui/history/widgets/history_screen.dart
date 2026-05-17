import 'package:flutter/material.dart';
import 'package:github_user_explorer/ui/history/view_models/history_viewmodel.dart';

class HistoryScreen extends StatelessWidget {
  final HistoryViewModel viewModel;

  const HistoryScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Aqui agora fica o historico'),
      ),
    );
  }
}
