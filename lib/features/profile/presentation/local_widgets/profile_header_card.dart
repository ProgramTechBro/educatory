import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/rating_stars.dart';

class ProfileHeaderCard extends StatelessWidget {
  final VoidCallback onChangePhotoTap;

  const ProfileHeaderCard({super.key, required this.onChangePhotoTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: AppNetworkImages.currentUserAvatar,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              OutlinedButton(
                onPressed: onChangePhotoTap,
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  side: const BorderSide(color: AppColors.neutral300),
                  minimumSize: const Size(100, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Change Photo',
                  style: AppTypography.bodySmallMedium.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('Muhammad Shahin', style: AppTypography.h3SemiBold),
          Text(
            '880 1777395216',
            style: AppTypography.bodyLargeRegular.copyWith(
              color: AppColors.neutral500,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const RatingStars(rating: 4.5),
              const SizedBox(width: 8),
              Text(
                '4.5',
                style: AppTypography.bodySmallMedium.copyWith(
                  color: AppColors.neutral900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
