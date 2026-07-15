enum CourseModuleType { video, reading, assignment }

class CourseModuleEntity {
  final String title;
  final String meta;
  final CourseModuleType type;
  final bool isCompleted;
  final String? thumbnail;

  const CourseModuleEntity({
    required this.title,
    required this.meta,
    required this.type,
    this.isCompleted = false,
    this.thumbnail,
  });
}
