class LessonCategory {
  const LessonCategory({required this.id, required this.title});

  final String id;
  final String title;
}

class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.duration,
    required this.progress,
    required this.summary,
    required this.scriptureReferences,
    required this.keyDoctrine,
    required this.commonErrors,
    required this.evangelismApplication,
    required this.practiceQuestions,
  });

  final String id;
  final String title;
  final String categoryId;
  final String duration;
  final double progress;
  final String summary;
  final List<String> scriptureReferences;
  final List<String> keyDoctrine;
  final List<String> commonErrors;
  final List<String> evangelismApplication;
  final List<String> practiceQuestions;
}
