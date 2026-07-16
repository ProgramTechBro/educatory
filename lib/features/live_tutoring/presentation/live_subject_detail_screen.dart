import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/live_tutoring_local_datasource.dart';
import 'local_widgets/subject_header_card.dart';
import 'local_widgets/subject_tutor_tile.dart';

class LiveSubjectDetailScreen extends StatelessWidget {
  const LiveSubjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSource = LiveTutoringLocalDataSource();
    final subject = dataSource.getSubjectDetail();
    final tutors = dataSource.getSubjectTutors();

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
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
                        subject.code,
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
                        SubjectHeaderCard(subject: subject),
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
                          child: Text(
                            subject.description,
                            style: AppTypography.bodySmallRegular.copyWith(
                              color: AppColors.neutral600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${tutors.length} Available Tutors',
                          style: AppTypography.h4SemiBold,
                        ),
                        const SizedBox(height: 8),
                        for (final tutor in tutors) ...[
                          SubjectTutorTile(
                            tutor: tutor,
                            onTap: () => context.push(AppRoutes.tutorDetail),
                          ),
                          if (tutor != tutors.last)
                            const SizedBox(height: 12),
                        ],
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
