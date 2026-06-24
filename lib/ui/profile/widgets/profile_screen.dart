import 'package:flutter/material.dart';
import 'package:github_user_explorer/routing/routes.dart';
import 'package:github_user_explorer/ui/core/themes/colors.dart';
import 'package:github_user_explorer/ui/profile/view_models/profile_viewmodel.dart' show ProfileViewModel, RepoSort;
import 'package:github_user_explorer/ui/profile/widgets/card_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileViewModel viewModel;
  final int id;

  const ProfileScreen({super.key, required this.viewModel, required this.id});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadUser(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Watch((context) {
                  if (widget.viewModel.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (widget.viewModel.errorMessage.value != null) {
                    return Center(child: Text(widget.viewModel.errorMessage.value!));
                  }

                  return Container(
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
                            border: Border.all(width: .5, color: AppColors.onSurfaceVariant),
                            image: DecorationImage(image: NetworkImage(widget.viewModel.profile.value!.avatarUrl))
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (widget.viewModel.profile.value?.name != null)
                          Text(widget.viewModel.profile.value!.name!, style: Theme.of(context).textTheme.headlineLarge),
                        Text(widget.viewModel.profile.value!.login, style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 16),
                        if (widget.viewModel.profile.value?.bio != null) ...[
                          Text(widget.viewModel.profile.value!.bio!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 16),
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(widget.viewModel.profile.value!.followers.toString(), style: Theme.of(context).textTheme.bodyMedium),
                                  Text('Followers', style: Theme.of(context).textTheme.labelSmall)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(widget.viewModel.profile.value!.following.toString(), style: Theme.of(context).textTheme.bodyMedium),
                                  Text('Following', style: Theme.of(context).textTheme.labelSmall)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(widget.viewModel.profile.value!.repos.toString(), style: Theme.of(context).textTheme.bodyMedium),
                                  Text('Repos', style: Theme.of(context).textTheme.labelSmall)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () async {
                      if (widget.viewModel.profile.value?.htmlUrl == null) return;
                      final Uri url = Uri.parse(widget.viewModel.profile.value!.htmlUrl);
                      await launchUrl(url,mode: LaunchMode.externalApplication);
                    },
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
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Repositories', style: Theme.of(context).textTheme.titleMedium),
                    Watch((context) => TextButton.icon(
                      onPressed: widget.viewModel.toggleSort,
                      icon: Icon(
                        widget.viewModel.repoSort.value == RepoSort.newest
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        size: 14,
                      ),
                      label: Text(
                        widget.viewModel.repoSort.value == RepoSort.newest
                            ? 'Most recent'
                            : 'Older',
                      ),
                    )),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              Watch((context) {
                if (widget.viewModel.isLoadingRepos.value) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final repos = widget.viewModel.repos.value;

                if (repos.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('No repository created.'),
                    )
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final repo = repos[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CardRepository(
                          title: repo.name,
                          mode: repo.visibility,
                          stars: repo.stars,
                          update: repo.updatedAt,
                          description: repo.description,
                          lang: repo.language,
                          onTap: () => context.push(Routes.repository, extra: repo),
                        ),
                      );
                    },
                    childCount: repos.length,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
