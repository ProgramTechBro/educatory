class EnrolledCourseEntity {
  final String id;
  final String image;
  final String title;
  final String author;
  final String duration;
  final double price;
  final double progress;

  const EnrolledCourseEntity({
    required this.id,
    required this.image,
    required this.title,
    required this.author,
    required this.duration,
    required this.price,
    required this.progress,
  });
}
