import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/course_detail_local_datasource.dart';
import '../domain/entities/course_module_entity.dart';
import 'bloc/video_player/video_player_bloc.dart';
import 'local_widgets/course_module_tile.dart';
import 'local_widgets/video_player_card.dart';

class PlayingCourseScreen extends StatelessWidget {
  const PlayingCourseScreen({super.key});

  void _openModule(BuildContext context, CourseModuleEntity module) {
    switch (module.type) {
      case CourseModuleType.reading:
        context.push(AppRoutes.readingArticle);
        break;
      case CourseModuleType.assignment:
        context.push(AppRoutes.quiz);
        break;
      case CourseModuleType.video:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final detail = CourseDetailLocalDataSource().getCourseDetail();

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  BlocProvider(
                    create: (context) => VideoPlayerBloc(),
                    child: VideoPlayerCard(thumbnail: detail.course.image),
                  ),
                  Positioned(
                    left: 4,
                    top: 4,
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 24,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(detail.course.title, style: AppTypography.h4SemiBold),
                    const SizedBox(height: 4),
                    Text(
                      detail.course.author,
                      style: AppTypography.bodyLargeRegular.copyWith(
                        color: AppColors.neutral600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Course Materials', style: AppTypography.h4SemiBold),
                    const SizedBox(height: 12),
                    for (final module in detail.modules) ...[
                      CourseModuleTile(
                        module: module,
                        onTap: () => _openModule(context, module),
                      ),
                      if (module != detail.modules.last)
                        const SizedBox(height: 8),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
