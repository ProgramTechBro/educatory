import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/rating_stars.dart';
import '../../domain/entities/tutor_detail_entity.dart';

class TutorReviewTile extends StatelessWidget {
  final TutorReviewEntity review;

  const TutorReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: review.avatar != null
                  ? CachedNetworkImage(
                      imageUrl: review.avatar!,
                      width: 44,
                      height: 44,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 44,
                      height: 44,
                      color: AppColors.neutral300,
                      child: const Icon(
                        Icons.person,
                        size: 24,
                        color: AppColors.white,
                      ),
                    ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  review.reviewerName,
                  style: AppTypography.bodyLargeMedium,
                ),
                Row(
                  children: [
                    RatingStars(rating: review.rating),
                    const SizedBox(width: 12),
                    Text(
                      review.date,
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          review.comment,
          style: AppTypography.bodySmallRegular.copyWith(
            color: AppColors.neutral600,
          ),
        ),
      ],
    );
  }
}
