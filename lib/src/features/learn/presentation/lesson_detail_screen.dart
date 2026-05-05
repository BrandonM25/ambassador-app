import 'package:ambassador_app/src/core/theme/app_colors.dart';
import 'package:ambassador_app/src/core/widgets/premium_card.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:ambassador_app/src/features/learn/domain/lesson.dart';
import 'package:flutter/material.dart';

class LessonDetailScreen extends StatelessWidget {
  const LessonDetailScreen({super.key, required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            PremiumCard(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SectionHeader(title: 'Lesson Progress'),
                const SizedBox(height: 8),
                ClipRRect(borderRadius: BorderRadius.circular(999), child: LinearProgressIndicator(value: lesson.progress, minHeight: 10, backgroundColor: AppColors.navy, valueColor: const AlwaysStoppedAnimation(AppColors.gold))),
                const SizedBox(height: 8),
                Text('Progress tracking placeholder (${(lesson.progress * 100).toInt()}% complete).'),
              ]),
            ),
            const SizedBox(height: 12),
            _DetailSection(title: 'Scripture References', items: lesson.scriptureReferences),
            _DetailSection(title: 'Key Doctrine', items: lesson.keyDoctrine),
            _DetailSection(title: 'Common Errors', items: lesson.commonErrors),
            _DetailSection(title: 'Evangelism Application', items: lesson.evangelismApplication),
            _DetailSection(title: 'Practice Questions', items: lesson.practiceQuestions),
          ],
        ),
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({required this.title, required this.items});

  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: PremiumCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: title),
            const SizedBox(height: 8),
            ...items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(Icons.circle, size: 6, color: AppColors.gold),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item)),
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}
