import 'package:flutter/material.dart';
import 'tutor_entity.dart';

class TutorEducationEntity {
  final IconData icon;
  final Color iconBackground;
  final String degree;
  final String institution;
  final String years;

  const TutorEducationEntity({
    required this.icon,
    required this.iconBackground,
    required this.degree,
    required this.institution,
    required this.years,
  });
}

class TutorReviewEntity {
  final String? avatar;
  final String reviewerName;
  final double rating;
  final String date;
  final String comment;

  const TutorReviewEntity({
    required this.avatar,
    required this.reviewerName,
    required this.rating,
    required this.date,
    required this.comment,
  });
}

class TutorDetailEntity {
  final TutorEntity tutor;
  final String bio;
  final List<TutorEducationEntity> education;
  final List<TutorReviewEntity> reviews;

  const TutorDetailEntity({
    required this.tutor,
    required this.bio,
    required this.education,
    required this.reviews,
  });
}
