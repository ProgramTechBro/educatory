import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/live_tutoring_local_datasource.dart';
import 'local_widgets/tutor_education_tile.dart';
import 'local_widgets/tutor_profile_card.dart';
import 'local_widgets/tutor_review_tile.dart';

class TutorDetailScreen extends StatelessWidget {
  const TutorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detail = LiveTutoringLocalDataSource().getTutorDetail();

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      bottomNavigationBar: TwoButtonBottomBar(
        trailingLabel: 'Book Me',
        onTrailingTap: () => context.push(AppRoutes.scheduleTutoring),
      ),
      body: Stack(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.gradientBlue,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 24, 0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.chevron_left,
                          size: 24,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        detail.tutor.name,
                        style: AppTypography.bodyLargeRegular.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TutorProfileCard(detail: detail),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: AppColors.inputDropShadow,
                          ),
                          child: Column(
                            children: [
                              for (final entry in detail.education) ...[
                                TutorEducationTile(entry: entry),
                                if (entry != detail.education.last) ...[
                                  const SizedBox(height: 12),
                                  const Divider(
                                    height: 1,
                                    color: AppColors.neutral200,
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: AppColors.inputDropShadow,
                          ),
                          child: Column(
                            children: [
                              for (final review in detail.reviews) ...[
                                TutorReviewTile(review: review),
                                if (review != detail.reviews.last) ...[
                                  const SizedBox(height: 16),
                                  const Divider(
                                    height: 1,
                                    color: AppColors.neutral200,
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
