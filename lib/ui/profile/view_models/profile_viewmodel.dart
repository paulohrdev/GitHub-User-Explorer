import 'package:github_user_explorer/data/repositories/history_repository.dart';
import 'package:github_user_explorer/data/repositories/users_repository.dart';
import 'package:github_user_explorer/domain/model/history_entry.dart';
import 'package:github_user_explorer/domain/model/profile_model.dart';
import 'package:github_user_explorer/domain/model/repository_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum RepoSort { newest, oldest }

class ProfileViewModel {
  ProfileViewModel({
    required this.usersRepository,
    required this.historyRepository,
  });

  final UsersRepository usersRepository;
  final HistoryRepository historyRepository;

  final isLoading = signal(true);
  final errorMessage = signal<String?>(null);
  final profile = signal<ProfileModel?>(null);

  final isLoadingRepos = signal(true);
  final errorMessageRepos = signal<String?>(null);
  final repos = signal<List<RepositoryModel>>([]);
  final repoSort = signal(RepoSort.newest);

  void toggleSort() {
    if (isLoadingRepos.value) return;
    repoSort.value = repoSort.value == RepoSort.newest ? RepoSort.oldest : RepoSort.newest;
    loadRepos();
  }

  Future<void> loadUser(int id) async {
    isLoading.value = true;
    errorMessage.value = null;

    final result = await usersRepository.getUser(id);

    result.fold(
      (error) => errorMessage.value = error,
      (data) {
        profile.value = data;
        historyRepository.save(HistoryEntry(
          id: data.id,
          login: data.login,
          avatarUrl: data.avatarUrl,
          htmlUrl: data.htmlUrl,
          visitedAt: DateTime.now(),
        ));
        loadRepos();
      },
    );

    isLoading.value = false;
  }

  Future<void> loadRepos() async {
    isLoadingRepos.value = true;
    errorMessageRepos.value = null;

    final direction = repoSort.value == RepoSort.newest ? 'desc' : 'asc';
    final result = await usersRepository.getRepos(profile.value!.login, direction: direction);

    result.fold(
      (error) => errorMessageRepos.value = error,
      (data) => repos.value = data,
    );

    isLoadingRepos.value = false;
  }
}
