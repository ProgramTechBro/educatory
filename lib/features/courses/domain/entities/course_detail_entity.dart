import 'package:flutter/material.dart';
import 'course_entity.dart';
import 'course_module_entity.dart';

class CourseIncludeEntity {
  final IconData icon;
  final String label;

  const CourseIncludeEntity({required this.icon, required this.label});
}

class CourseDetailEntity {
  final CourseEntity course;
  final String description;
  final List<CourseIncludeEntity> includes;
  final List<CourseModuleEntity> modules;

  const CourseDetailEntity({
    required this.course,
    required this.description,
    required this.includes,
    required this.modules,
  });
}
