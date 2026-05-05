import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/features/learn/domain/lesson.dart';
import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({super.key, required this.lesson, this.onTap});

  final Lesson lesson;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return PremiumCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lesson.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.ivory, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Text(lesson.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(value: lesson.progress, minHeight: 7, backgroundColor: AppColors.navy, valueColor: const AlwaysStoppedAnimation(AppColors.gold)),
                ),
              ),
              const SizedBox(width: 10),
              Text(lesson.duration, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.slate)),
            ],
          ),
        ],
      ),
    );
  }
}
