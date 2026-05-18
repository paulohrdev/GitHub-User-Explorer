import 'package:flutter/material.dart';
import 'package:github_user_explorer/domain/model/repository_model.dart';
import 'package:github_user_explorer/ui/core/themes/colors.dart';
import 'package:github_user_explorer/ui/repository/view_models/repository_viewmodel.dart';
import 'package:github_user_explorer/ui/repository/widgets/card_info.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryScreen extends StatelessWidget {
  final RepositoryViewModel viewModel;
  final RepositoryModel repository;

  const RepositoryScreen({super.key, required this.viewModel, required this.repository});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM d, yyyy', 'pt_BR');

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Row(
                children: [
                  Icon(Icons.book, size: 24),
                  const SizedBox(width: 8),
                  Expanded(child: Text(repository.name, style: Theme.of(context).textTheme.headlineLarge)),
                  Spacer(),
                  Chip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    label: Text(repository.visibility, style: Theme.of(context).textTheme.labelSmall),
                  ),
                ],
              ),
              if (repository.descriptions != null) ...[
                const SizedBox(height: 8),
                Text(repository.descriptions!, style: Theme.of(context).textTheme.bodySmall),
              ],
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CardInfo(
                      icon: Icons.star_border,
                      title: 'Stars',
                      value: repository.stars.toString(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CardInfo(
                      icon: Icons.bug_report_outlined,
                      title: 'Issues',
                      value: repository.issues.toString(),
                    ),
                  ),
                ],
              ),
              if (repository.language != null) ...[
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1, color: AppColors.outlineVariant),
                      bottom: BorderSide(width: 1, color: AppColors.outlineVariant),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Languages'),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.surfaceContainerHighest,
                          border: Border.all(width: 2, color: AppColors.outlineVariant),
                        ),
                        child: Text(repository.language!, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.onSurface)),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Created'),
                  Text(dateFormat.format(repository.createdAt)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Last Updated'),
                  Text(dateFormat.format(repository.updatedAt)),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: AppColors.tertiaryContainer),
                onPressed: () async {
                  final Uri uri = Uri.parse(repository.url);
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.open_in_new, color: AppColors.onTertiaryContainer),
                    const SizedBox(width: 4),
                    Text('Open on Github', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.onTertiaryContainer)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
