class CourseReviewEntity {
  final String avatar;
  final String reviewerName;
  final double rating;
  final String date;
  final String comment;

  const CourseReviewEntity({
    required this.avatar,
    required this.reviewerName,
    required this.rating,
    required this.date,
    required this.comment,
  });
}
