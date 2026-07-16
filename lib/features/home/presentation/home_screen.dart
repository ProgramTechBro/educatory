import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../courses/domain/entities/search_target.dart';
import '../data/datasources/home_local_datasource.dart';
import 'local_widgets/app_drawer.dart';
import 'local_widgets/course_card.dart';
import 'local_widgets/home_app_bar.dart';
import 'local_widgets/home_search_field.dart';
import 'local_widgets/live_subject_card.dart';
import 'local_widgets/promo_banner.dart';
import 'local_widgets/request_course_card.dart';
import 'local_widgets/section_title.dart';
import 'local_widgets/tutor_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeLocalDataSource _dataSource = HomeLocalDataSource();

  @override
  Widget build(BuildContext context) {
    final liveSubjects = _dataSource.getLiveSubjects();
    final trendingCourses = _dataSource.getTrendingCourses();
    final topNewCourses = _dataSource.getTopNewCourses();
    final topTutors = _dataSource.getTopTutors();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
              child: HomeAppBar(
                notificationCount: 5,
                onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
                onNotificationTap: () =>
                    context.push(AppRoutes.notifications),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: HomeSearchField(
                        onFilterTap: () => context.push(
                          AppRoutes.filter,
                          extra: SearchTarget.courses,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SectionTitle(
                        title: 'Live Subject Tutoring',
                        actionLabel: 'All Subjects',
                        onActionTap: () =>
                            context.push(AppRoutes.allLiveSubjects),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          for (final subject in liveSubjects) ...[
                            LiveSubjectCard(
                              subject: subject,
                              onTap: () =>
                                  context.push(AppRoutes.liveSubjectDetail),
                            ),
                            const SizedBox(width: 8),
                          ],
                          RequestCourseCard(
                            onTap: () =>
                                context.push(AppRoutes.requestNewSubject),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PromoBanner(onRedeemTap: () {}),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SectionTitle(
                        title: 'Trending Courses',
                        actionLabel: 'All Courses',
                        onActionTap: () => context.push(AppRoutes.allCourses),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          for (final course in trendingCourses) ...[
                            CourseCard(
                              course: course,
                              onTap: () =>
                                  context.push(AppRoutes.courseDetail),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: const SectionTitle(title: 'Weekly Top Live Tutors'),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          for (final tutor in topTutors) ...[
                            TutorCard(tutor: tutor, onTap: () {}),
                            const SizedBox(width: 12),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SectionTitle(
                        title: 'Top New Courses',
                        actionLabel: 'All Courses',
                        onActionTap: () => context.push(AppRoutes.allCourses),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          for (final course in topNewCourses) ...[
                            CourseCard(
                              course: course,
                              onTap: () =>
                                  context.push(AppRoutes.courseDetail),
                            ),
                            const SizedBox(width: 16),
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
    );
  }
}
