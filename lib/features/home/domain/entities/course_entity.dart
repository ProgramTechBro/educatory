enum CourseBadgeType { topAuthor, editorsChoice, bestseller, mostPopular }

class CourseEntity {
  final String image;
  final String title;
  final String author;
  final String duration;
  final double price;
  final double originalPrice;
  final double rating;
  final int ratingCount;
  final CourseBadgeType badge;

  const CourseEntity({
    required this.image,
    required this.title,
    required this.author,
    required this.duration,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.ratingCount,
    required this.badge,
  });
}
