import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../../home/presentation/local_widgets/home_search_field.dart';
import '../data/datasources/courses_local_datasource.dart';
import 'local_widgets/filtered_course_card.dart';

class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = CoursesLocalDataSource().getAllCourses();

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
          'All Courses',
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
              HomeSearchField(
                onFilterTap: () => context.push(AppRoutes.filter),
              ),
              const SizedBox(height: 20),
              Text('All Courses', style: AppTypography.h4SemiBold),
              const SizedBox(height: 12),
              for (final course in courses) ...[
                FilteredCourseCard(course: course, onTap: () {}),
                if (course != courses.last) const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
