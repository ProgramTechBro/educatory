enum ReviewTargetType { tutor, course }

class ReviewEntity {
  final ReviewTargetType targetType;
  final String targetName;
  final double rating;
  final String reviewText;
  final String date;

  const ReviewEntity({
    required this.targetType,
    required this.targetName,
    required this.rating,
    required this.reviewText,
    required this.date,
  });
}
