import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../../courses/presentation/local_widgets/filtered_course_card.dart';
import '../data/datasources/search_local_datasource.dart';
import '../domain/entities/search_target.dart';
import 'local_widgets/results_search_bar.dart';
import 'local_widgets/tutor_result_card.dart';

class FilteredResultsScreen extends StatelessWidget {
  final SearchTarget target;
  final int filterCount;

  const FilteredResultsScreen({
    super.key,
    required this.target,
    required this.filterCount,
  });

  @override
  Widget build(BuildContext context) {
    final dataSource = SearchLocalDataSource();
    final isTutors = target == SearchTarget.tutors;

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
          'Filtered Results',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResultsSearchBar(
                filterCount: filterCount,
                onFilterTap: () => context.push(
                  AppRoutes.filter,
                  extra: target,
                ),
              ),
              const SizedBox(height: 20),
              if (isTutors)
                ..._buildTutorResults(dataSource)
              else
                ..._buildCourseResults(context, dataSource),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTutorResults(SearchLocalDataSource dataSource) {
    final tutors = dataSource.getFilteredTutors();
    return [
      for (final tutor in tutors) ...[
        TutorResultCard(tutor: tutor, onTap: () {}),
        if (tutor != tutors.last) const SizedBox(height: 12),
      ],
    ];
  }

  List<Widget> _buildCourseResults(
    BuildContext context,
    SearchLocalDataSource dataSource,
  ) {
    final courses = dataSource.getFilteredCourses();
    return [
      Text('All Courses', style: AppTypography.h4SemiBold),
      const SizedBox(height: 12),
      for (final course in courses) ...[
        FilteredCourseCard(
          course: course,
          onTap: () => context.push(AppRoutes.courseDetail),
        ),
        if (course != courses.last) const SizedBox(height: 16),
      ],
    ];
  }
}
