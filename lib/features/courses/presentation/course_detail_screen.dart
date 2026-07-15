import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/course_detail_local_datasource.dart';
import '../domain/entities/course_detail_entity.dart';
import '../domain/entities/course_detail_tab.dart';
import '../domain/entities/course_module_entity.dart';
import 'bloc/course_detail_bloc.dart';
import 'bloc/course_detail_event.dart';
import 'bloc/course_detail_state.dart';
import 'local_widgets/course_author_card.dart';
import 'local_widgets/course_detail_header_card.dart';
import 'local_widgets/course_includes_grid.dart';
import 'local_widgets/course_module_tile.dart';
import 'local_widgets/course_review_tile.dart';
import 'local_widgets/course_tab_bar.dart';
import 'local_widgets/education_tile.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseDetailBloc(),
      child: const _CourseDetailScreenBody(),
    );
  }
}

class _CourseDetailScreenBody extends StatelessWidget {
  const _CourseDetailScreenBody();

  @override
  Widget build(BuildContext context) {
    final dataSource = CourseDetailLocalDataSource();
    final detail = dataSource.getCourseDetail();

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      bottomNavigationBar: TwoButtonBottomBar(
        trailingLabel: 'Purchase for \$${detail.course.price.toStringAsFixed(2)}',
        onTrailingTap: () => context.push(AppRoutes.orderDetails),
      ),
      body: Stack(
        children: [
          Container(
            height: 220,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF7421CF), Color(0xFFB983FD)],
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
                        'About Course',
                        style: AppTypography.bodyLargeRegular.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CourseDetailHeaderCard(course: detail.course),
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
                                detail.description,
                                style: AppTypography.bodySmallRegular
                                    .copyWith(color: AppColors.neutral600),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CourseTabBar(
                              activeTab: state.activeTab,
                              onChanged: (tab) => context
                                  .read<CourseDetailBloc>()
                                  .add(CourseDetailTabChanged(tab)),
                            ),
                            const SizedBox(height: 16),
                            if (state.activeTab == CourseDetailTab.about)
                              _AboutTab(
                                includes: detail.includes,
                                modules: detail.modules,
                              )
                            else if (state.activeTab == CourseDetailTab.reviews)
                              _ReviewsTab(dataSource: dataSource)
                            else
                              _AuthorTab(dataSource: dataSource),
                          ],
                        ),
                      );
                    },
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

class _AboutTab extends StatelessWidget {
  final List<CourseIncludeEntity> includes;
  final List<CourseModuleEntity> modules;

  const _AboutTab({required this.includes, required this.modules});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('What this Course Includes', style: AppTypography.h4SemiBold),
        const SizedBox(height: 8),
        CourseIncludesGrid(includes: includes),
        const SizedBox(height: 16),
        Text('Course Materials', style: AppTypography.h4SemiBold),
        const SizedBox(height: 8),
        for (final module in modules) ...[
          CourseModuleTile(module: module, onTap: () {}),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _ReviewsTab extends StatelessWidget {
  final CourseDetailLocalDataSource dataSource;

  const _ReviewsTab({required this.dataSource});

  @override
  Widget build(BuildContext context) {
    final reviews = dataSource.getCourseReviews();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Column(
        children: [
          for (final review in reviews) ...[
            CourseReviewTile(review: review),
            if (review != reviews.last) ...[
              const SizedBox(height: 12),
              const Divider(height: 1, color: AppColors.neutral200),
              const SizedBox(height: 12),
            ],
          ],
        ],
      ),
    );
  }
}

class _AuthorTab extends StatelessWidget {
  final CourseDetailLocalDataSource dataSource;

  const _AuthorTab({required this.dataSource});

  @override
  Widget build(BuildContext context) {
    final author = dataSource.getCourseAuthor();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CourseAuthorCard(author: author),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: AppColors.inputDropShadow,
          ),
          child: Column(
            children: [
              for (final entry in author.education) ...[
                EducationTile(entry: entry),
                if (entry != author.education.last) ...[
                  const SizedBox(height: 12),
                  const Divider(height: 1, color: AppColors.neutral200),
                  const SizedBox(height: 12),
                ],
              ],
            ],
          ),
        ),
      ],
    );
  }
}
