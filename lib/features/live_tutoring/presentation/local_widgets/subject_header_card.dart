import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/subject_detail_entity.dart';

class SubjectHeaderCard extends StatelessWidget {
  final SubjectDetailEntity subject;

  const SubjectHeaderCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              subject.image,
              width: double.infinity,
              height: 152,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(subject.title, style: AppTypography.h4Medium),
        ],
      ),
    );
  }
}
