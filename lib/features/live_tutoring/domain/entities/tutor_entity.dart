class TutorEntity {
  final String id;
  final String avatar;
  final String name;
  final String institution;
  final double rating;
  final int ratingCount;
  final double hourlyRate;
  final double originalHourlyRate;
  final bool isOnline;

  const TutorEntity({
    required this.id,
    required this.avatar,
    required this.name,
    required this.institution,
    required this.rating,
    required this.ratingCount,
    required this.hourlyRate,
    required this.originalHourlyRate,
    this.isOnline = false,
  });
}
