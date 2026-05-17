import 'dart:async';

import 'package:github_user_explorer/data/repositories/users_repository.dart';
import 'package:github_user_explorer/domain/model/user_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SearchViewModel {
  SearchViewModel({required this.usersRepository});

  final UsersRepository usersRepository;

  final query = signal('');
  final users = signal<List<UserModel>>([]);
  final isLoading = signal(false);
  final errorMessage = signal<String?>(null);

  Timer? _debounce;

  void search(String value) {
    query.value = value;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 700), () => _fetch());
  }

  void clearSearch() {
    query.value = '';
    _debounce?.cancel();
    users.value = [];
    errorMessage.value = null;
  }

  Future<void> _fetch() async {
    if (query.trim().isEmpty) {
      users.value = [];
      errorMessage.value = null;
      return;
    }

    isLoading.value = true;
    errorMessage.value = null;

    final result = await usersRepository.searchUsers(query.trim());

    result.fold(
      (error) => errorMessage.value = error,
      (data) => users.value = data,
    );

    isLoading.value = false;
  }
}
