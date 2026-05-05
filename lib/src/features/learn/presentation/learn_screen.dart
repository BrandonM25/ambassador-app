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
      for (final category in lessonCategories)
        category: lessons.where((lesson) => lesson.categoryId == category.id).toList(),
    };

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SectionHeader(title: 'Teaching Library'),
            const SizedBox(height: 14),
            ...groupedLessons.entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
                            childAspectRatio: isMobile ? 2 : 1.55,
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
