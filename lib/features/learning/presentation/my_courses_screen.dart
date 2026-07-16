import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/my_courses_local_datasource.dart';
import 'local_widgets/enrolled_course_card.dart';
import 'local_widgets/rate_course_sheet.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  void _handleAction(
    BuildContext context,
    EnrolledCourseAction action,
  ) {
    switch (action) {
      case EnrolledCourseAction.playNow:
        context.push(AppRoutes.playingCourse);
        break;
      case EnrolledCourseAction.rateCourse:
        RateCourseSheet.show(context);
        break;
      case EnrolledCourseAction.report:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Course reported')),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final courses = MyCoursesLocalDataSource().getEnrolledCourses();

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
          'My Courses',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
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
              for (final course in courses) ...[
                EnrolledCourseCard(
                  course: course,
                  onTap: () => context.push(AppRoutes.playingCourse),
                  onAction: (action) => _handleAction(context, action),
                ),
                if (course != courses.last) ...[
                  const SizedBox(height: 16),
                  const Divider(height: 1, color: AppColors.neutral200),
                  const SizedBox(height: 16),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
