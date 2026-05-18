import 'package:flutter/material.dart';
import 'package:github_user_explorer/routing/routes.dart';
import 'package:github_user_explorer/ui/search/view_models/search_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.viewModel});

  final SearchViewModel viewModel;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onClear() {
    _controller.clear();
    widget.viewModel.clearSearch();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Watch((context) => TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Buscar usuário no GitHub...',
                    prefixIcon: const Icon(Icons.search),
                    border: const OutlineInputBorder(),
                    suffixIcon: widget.viewModel.query.value.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: _onClear,
                        )
                      : null,
                  ),
                  onChanged: widget.viewModel.search,
                )),
              ),
              Expanded(
                child: Watch((context) {
                  if (widget.viewModel.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (widget.viewModel.errorMessage.value != null) {
                    return Center(child: Text(widget.viewModel.errorMessage.value!));
                  }

                  final users = widget.viewModel.users.value;

                  if (users.isEmpty) {
                    return const Center(child: Text('Nenhum usuário encontrado'));
                  }

                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatarUrl),
                        ),
                        title: Text(user.login),
                        onTap: () {
                          _onClear();
                          FocusScope.of(context).unfocus();
                          context.push(Routes.profileWithId(user.id));
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
