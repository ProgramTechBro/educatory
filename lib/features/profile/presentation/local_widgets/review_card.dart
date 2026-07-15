import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/rating_stars.dart';
import '../../domain/entities/review_entity.dart';

class ReviewCard extends StatelessWidget {
  final ReviewEntity review;
  final VoidCallback onMoreTap;

  const ReviewCard({
    super.key,
    required this.review,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.neutral200),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'You Rated',
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
              ),
              InkWell(
                onTap: onMoreTap,
                child: const Icon(
                  Icons.more_vert,
                  size: 20,
                  color: AppColors.neutral700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(review.targetName, style: AppTypography.bodyLargeMedium),
          const SizedBox(height: 16),
          Row(
            children: [
              RatingStars(rating: review.rating, size: 16),
              const SizedBox(width: 8),
              Text(
                '${review.rating}',
                style: AppTypography.bodySmallMedium.copyWith(
                  color: AppColors.neutral900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review.reviewText,
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.neutral600,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              review.date,
              style: AppTypography.bodySmallMedium.copyWith(
                color: AppColors.neutral900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
