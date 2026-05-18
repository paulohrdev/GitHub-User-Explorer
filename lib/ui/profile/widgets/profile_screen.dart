import 'package:flutter/material.dart';
import 'package:github_user_explorer/routing/routes.dart';
import 'package:github_user_explorer/ui/core/themes/colors.dart';
import 'package:github_user_explorer/ui/profile/view_models/profile_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class ProfileScreen extends StatelessWidget {
  final ProfileViewModel viewModel;

  const ProfileScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: .1, color: AppColors.onSurfaceVariant)
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: .5, color: AppColors.onSurfaceVariant)
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text('Eleanor', style: Theme.of(context).textTheme.headlineLarge),
                    Text('@elvance_dev', style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 16),
                    Text('Senior Systems Engineer. Passionate about Rust, distributed systems, and minimal UI. Building the next generation of terminal tools.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text('1,402', style: Theme.of(context).textTheme.bodyMedium),
                              Text('Followers', style: Theme.of(context).textTheme.labelSmall)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('48', style: Theme.of(context).textTheme.bodyMedium),
                              Text('Following', style: Theme.of(context).textTheme.labelSmall)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('112', style: Theme.of(context).textTheme.bodyMedium),
                              Text('Repos', style: Theme.of(context).textTheme.labelSmall)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.open_in_new),
                      const SizedBox(width: 4),
                      Text('Open on Github')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Repositories', style: Theme.of(context).textTheme.titleMedium),
                  Text('sort'),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => context.push(Routes.repository),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    border: Border.all(width: 1, color: AppColors.outlineVariant)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.book, size: 14),
                          const SizedBox(width: 4),
                          Text('term-ui-rs', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.primary),),
                          Spacer(),
                          Chip(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            label: Text('Public', style: Theme.of(context).textTheme.labelSmall,),
                            elevation: 1,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text('A highly optimized, zero-allocation terminal UI rendering engine written entirely in Rust My personal dotfiles for Arch Linux. Focus on Neovim, Alacritty, and Tmux configurations for', maxLines: 2, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(toBeginningOfSentenceCase('RUST'.toLowerCase())),
                          const SizedBox(width: 16),
                          Icon(Icons.star_border, size: 16),
                          const SizedBox(width: 2),
                          Text('892'),
                          Spacer(),
                          Text('Updated 2d ago'),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
