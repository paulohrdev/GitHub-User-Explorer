import 'package:github_user_explorer/data/repositories/users_repository.dart';
import 'package:github_user_explorer/domain/model/profile_model.dart';
import 'package:github_user_explorer/domain/model/repository_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

class ProfileViewModel {
  ProfileViewModel({required this.usersRepository});

  final UsersRepository usersRepository;

  final isLoading = signal(true);
  final errorMessage = signal<String?>(null);
  final profile = signal<ProfileModel?>(null);

  final isLoadingRepos = signal(true);
  final errorMessageRepos = signal<String?>(null);
  final repos = signal<List<RepositoryModel>>([]);

  Future<void> loadUser(int id) async {
    isLoading.value = true;
    errorMessage.value = null;

    final result = await usersRepository.getUser(id);

    result.fold(
      (error) => errorMessage.value = error,
      (data) {
        profile.value = data;
        loadRepos();
      },
    );

    isLoading.value = false;
  }

  Future<void> loadRepos() async {
    isLoadingRepos.value = true;
    errorMessageRepos.value = null;

    final result = await usersRepository.getRepos(profile.value!.login);

    result.fold(
      (error) => errorMessageRepos.value = error,
      (data) => repos.value = data,
    );

    isLoadingRepos.value = false;
  }
}
