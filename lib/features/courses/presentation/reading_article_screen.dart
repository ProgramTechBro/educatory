import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/course_detail_local_datasource.dart';

class ReadingArticleScreen extends StatelessWidget {
  const ReadingArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final course = CourseDetailLocalDataSource().getCourseDetail().course;

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
          'Reading Article',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      bottomNavigationBar: TwoButtonBottomBar(
        trailingLabel: 'Continue',
        onTrailingTap: () => context.push(AppRoutes.quiz),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Analytical Thinking and Evaluation',
                style: AppTypography.h3SemiBold,
              ),
              const SizedBox(height: 8),
              Text(
                '${course.author} · Responsive Design',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  course.image,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Analytical thinking is the ability to break down complex '
                'information into smaller parts to understand how they fit '
                'together. It allows developers to evaluate problems '
                'logically, identify patterns, and make informed decisions '
                'when building responsive interfaces.',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral700,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),
              Text('Why It Matters', style: AppTypography.h4SemiBold),
              const SizedBox(height: 8),
              Text(
                'In responsive design, analytical thinking helps you '
                'evaluate how layouts behave across breakpoints, spot '
                'inconsistencies in spacing or hierarchy, and choose the '
                'right approach for fluid grids, flexible images, and media '
                'queries rather than relying on guesswork.',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral700,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 16),
              Text('Applying the Skill', style: AppTypography.h4SemiBold),
              const SizedBox(height: 8),
              Text(
                'Start by mapping the content hierarchy before writing any '
                'CSS. Ask what should resize, reflow, or hide at each '
                'breakpoint, then test your assumptions on real devices. '
                'This structured evaluation is what separates a page that '
                'merely shrinks from one that truly adapts.',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral700,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
