import 'package:flutter/material.dart';
import 'package:github_user_explorer/ui/core/themes/colors.dart';

class CardInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const CardInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: AppColors.outlineVariant)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 4),
              Text(title, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: Theme.of(context).textTheme.headlineLarge,),
        ],
      ),
    );
  }
}
