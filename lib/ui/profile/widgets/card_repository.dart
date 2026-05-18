import 'package:flutter/material.dart';
import 'package:github_user_explorer/ui/core/themes/colors.dart';
import 'package:intl/intl.dart';

class CardRepository extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String mode;
  final int stars;
  final DateTime update;
  final String? lang;
  final String? description;

  const CardRepository({
    super.key,
    required this.title,
    required this.mode,
    required this.stars,
    required this.update,
    this.lang,
    this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?.call,
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
                Expanded(child: Text(title, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.primary),)),
                Spacer(),
                Chip(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  label: Text(mode, style: Theme.of(context).textTheme.labelSmall,),
                  elevation: 1,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (description != null) ...[
              Text(description!, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 16),
            ],
            Row(
              children: [
                if (lang != null) ...[
                  Text(toBeginningOfSentenceCase(lang!.toLowerCase())),
                  const SizedBox(width: 16),
                ],
                Icon(Icons.star_border, size: 16),
                const SizedBox(width: 2),
                Text(stars.toString()),
                Spacer(),
                Text(DateFormat('dd/MM/yyyy', 'pt_BR').format(update)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
