import 'package:ambassador_app/src/core/theme/app_theme.dart';
import 'package:ambassador_app/src/core/widgets/section_header.dart';
import 'package:ambassador_app/src/features/learn/data/lesson_data.dart';
import 'package:ambassador_app/src/features/learn/presentation/lesson_detail_screen.dart';
import 'package:ambassador_app/src/features/learn/presentation/widgets/lesson_card.dart';
import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groupedLessons = {
      for (final category in lessonCategories) category: lessons.where((lesson) => lesson.categoryId == category.id).toList(),
    };

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spaceLg),
        child: ListView(
          children: [
            const SectionHeader(title: 'Teaching Library', subtitle: 'Structured pathways for conviction and confidence.'),
            const SizedBox(height: AppTheme.spaceMd),
            ...groupedLessons.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: AppTheme.spaceLg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.key.title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 10),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isMobile = constraints.maxWidth < 700;
                        final columns = isMobile ? 1 : 2;
                        return GridView.builder(
                          itemCount: entry.value.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: columns,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: isMobile ? 2.12 : 1.62,
                          ),
                          itemBuilder: (context, index) {
                            final lesson = entry.value[index];
                            return LessonCard(
                              lesson: lesson,
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => LessonDetailScreen(lesson: lesson)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
