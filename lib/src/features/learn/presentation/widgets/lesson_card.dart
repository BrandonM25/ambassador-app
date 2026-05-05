import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/features/learn/domain/lesson.dart';
import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({super.key, required this.lesson, this.onTap});
  final Lesson lesson;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return PremiumCard(
      onTap: onTap,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(lesson.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text(lesson.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
        const Spacer(),
        LinearProgressIndicator(value: lesson.progress, minHeight: 8, borderRadius: BorderRadius.circular(999), color: cs.primary, backgroundColor: cs.secondary.withValues(alpha: .25)),
      ]),
    );
  }
}
