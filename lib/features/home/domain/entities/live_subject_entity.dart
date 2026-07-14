import 'package:flutter/material.dart';

class LiveSubjectEntity {
  final String title;
  final String tutorCount;
  final String iconAsset;
  final List<Color> gradient;

  const LiveSubjectEntity({
    required this.title,
    required this.tutorCount,
    required this.iconAsset,
    required this.gradient,
  });
}
