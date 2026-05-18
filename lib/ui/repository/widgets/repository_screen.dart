import 'package:flutter/material.dart';
import 'package:github_user_explorer/ui/repository/view_models/repository_viewmodel.dart';

class RepositoryScreen extends StatelessWidget {
  final RepositoryViewModel viewModel;

  const RepositoryScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Repository Screen'),
      ),
    );
  }
}
