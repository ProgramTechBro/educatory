import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/network_avatar.dart';
import '../../../live_tutoring/domain/entities/tutor_entity.dart';

class ContactStatusCard extends StatelessWidget {
  final TutorEntity tutor;

  const ContactStatusCard({super.key, required this.tutor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              NetworkAvatar(imageUrl: tutor.avatar, size: 44),
              const SizedBox(width: 8),
              Text(tutor.name, style: AppTypography.h4Medium),
            ],
          ),
          if (tutor.isOnline)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.green500,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'Online',
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
