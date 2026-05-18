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
  final isLoadingMore = signal(false);
  final hasMore = signal(true);
  final errorMessage = signal<String?>(null);

  int _page = 1;
  static const int _perPage = 20;

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
    _page = 1;
    hasMore.value = true;
  }

  Future<void> loadMore() async {
    if (isLoading.value || isLoadingMore.value || !hasMore.value) return;

    isLoadingMore.value = true;

    final result = await usersRepository.searchUsers(query.value.trim(), page: _page);

    result.fold(
      (error) => errorMessage.value = error,
      (data) {
        if (data.length < _perPage) hasMore.value = false;
        users.value = [...users.value, ...data];
        _page++;
      },
    );

    isLoadingMore.value = false;
  }

  Future<void> _fetch() async {
    if (query.value.trim().isEmpty) {
      users.value = [];
      errorMessage.value = null;
      _page = 1;
      hasMore.value = true;
      return;
    }

    isLoading.value = true;
    errorMessage.value = null;
    _page = 1;
    hasMore.value = true;

    final result = await usersRepository.searchUsers(query.value.trim(), page: _page);

    result.fold(
      (error) => errorMessage.value = error,
      (data) {
        if (data.length < _perPage) hasMore.value = false;
        users.value = data;
        _page++;
      },
    );

    isLoading.value = false;
  }
}
