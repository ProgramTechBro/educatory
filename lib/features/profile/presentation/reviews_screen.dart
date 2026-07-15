import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../data/datasources/profile_local_datasource.dart';
import '../domain/entities/review_entity.dart';
import 'local_widgets/review_card.dart';

class ReviewsScreen extends StatelessWidget {
  final ReviewTargetType? filter;

  const ReviewsScreen({super.key, this.filter});

  @override
  Widget build(BuildContext context) {
    final allReviews = ProfileLocalDataSource().getMyReviews();
    final reviews = filter == null
        ? allReviews
        : allReviews.where((review) => review.targetType == filter).toList();

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.chevron_left,
            size: 24,
            color: AppColors.neutral900,
          ),
        ),
        title: Text(
          'Rating & Reviews',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      body: ListView.separated(
        itemCount: reviews.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return ReviewCard(review: reviews[index], onMoreTap: () {});
        },
      ),
    );
  }
}
