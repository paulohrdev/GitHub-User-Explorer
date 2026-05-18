import 'package:flutter/material.dart';
import 'package:github_user_explorer/routing/routes.dart';
import 'package:github_user_explorer/ui/history/view_models/history_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:signals_flutter/signals_flutter.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key, required this.viewModel});

  final HistoryViewModel viewModel;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Watch((context) {
          final entries = widget.viewModel.entries.value;

          if (entries.isEmpty) {
            return const Center(child: Text('Nenhum perfil visitado ainda'));
          }

          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(entry.avatarUrl),
                ),
                title: Text(entry.login),
                subtitle: Text(
                  DateFormat("dd/MM/yyyy 'às' HH:mm", 'pt_BR').format(entry.visitedAt),
                ),
                onTap: () => context.push(Routes.profileWithId(entry.id)),
              );
            },
          );
        }),
      ),
    );
  }
}
