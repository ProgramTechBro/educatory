import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/network_avatar.dart';
import '../../domain/entities/tutor_entity.dart';

class TutorCard extends StatelessWidget {
  final TutorEntity tutor;
  final VoidCallback onTap;

  const TutorCard({super.key, required this.tutor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.neutral300),
          borderRadius: BorderRadius.circular(10),
          boxShadow: AppColors.inputDropShadow,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NetworkAvatar(imageUrl: tutor.avatar, size: 52),
            const SizedBox(height: 12),
            Text(
              tutor.name,
              style: AppTypography.bodyLargeSemiBold,
            ),
            Text(
              tutor.subject,
              style: AppTypography.bodySmallRegular,
            ),
          ],
        ),
      ),
    );
  }
}
