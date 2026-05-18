import 'package:flutter/material.dart';
import 'package:github_user_explorer/routing/routes.dart';
import 'package:github_user_explorer/ui/core/themes/colors.dart';
import 'package:go_router/go_router.dart';

class TabsScreen extends StatelessWidget {
  final Widget child;

  const TabsScreen({
    super.key,
    required this.child,
  });

  bool _isActive(BuildContext context, String route) {
    return GoRouterState.of(context).uri.path.startsWith(route);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            child,
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildBottomNavigationBar(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 32, right: 32, bottom: 10),
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppColors.secondary),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: .08),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItem(
              icon: Icons.search,
              active: _isActive(context, Routes.search),
              onTap: () => context.go(Routes.search),
            ),
            _buildItem(
              icon: Icons.history,
              active: _isActive(context, Routes.history),
              onTap: () => context.go(Routes.history),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required bool active,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 12),
        alignment: Alignment.center,
        width: 60,
        height: 60,
        child: Column(
          children: [
            Icon(icon),
            const SizedBox(height: 5),
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: active ? AppColors.onPrimary : AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
