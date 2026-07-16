import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../../home/data/datasources/home_local_datasource.dart';
import '../../home/presentation/local_widgets/home_search_field.dart';
import '../../home/presentation/local_widgets/live_subject_card.dart';

class AllLiveSubjectsScreen extends StatelessWidget {
  const AllLiveSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = HomeLocalDataSource().getLiveSubjects();

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
          'Live Tutoring',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSearchField(
                      onFilterTap: () => context.push(AppRoutes.filter),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'All Live Subject Tutoring',
                      style: AppTypography.h4SemiBold,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final subject in subjects)
                          LiveSubjectCard(
                            subject: subject,
                            onTap: () =>
                                context.push(AppRoutes.liveSubjectDetail),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: InkWell(
                onTap: () => context.push(AppRoutes.requestNewSubject),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryButtonFill,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        size: 24,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Request New Subject',
                        style: AppTypography.bodyLargeMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
