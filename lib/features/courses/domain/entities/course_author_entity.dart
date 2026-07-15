import 'package:flutter/material.dart';

class EducationEntryEntity {
  final IconData icon;
  final Color iconBackground;
  final String degree;
  final String institution;
  final String years;

  const EducationEntryEntity({
    required this.icon,
    required this.iconBackground,
    required this.degree,
    required this.institution,
    required this.years,
  });
}

class CourseAuthorEntity {
  final String avatar;
  final String name;
  final String institution;
  final double rating;
  final int ratingCount;
  final String bio;
  final List<EducationEntryEntity> education;

  const CourseAuthorEntity({
    required this.avatar,
    required this.name,
    required this.institution,
    required this.rating,
    required this.ratingCount,
    required this.bio,
    required this.education,
  });
}
