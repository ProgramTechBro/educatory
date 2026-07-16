import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/course_progress_bar.dart';
import '../bloc/video_player/video_player_bloc.dart';
import '../bloc/video_player/video_player_event.dart';
import '../bloc/video_player/video_player_state.dart';

class VideoPlayerCard extends StatelessWidget {
  final String thumbnail;

  const VideoPlayerCard({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(thumbnail, fit: BoxFit.cover),
          Container(color: Colors.black.withValues(alpha: 0.35)),
          BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
            builder: (context, state) {
              return Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.replay_10,
                      size: 28,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 24),
                    GestureDetector(
                      onTap: () => context.read<VideoPlayerBloc>().add(
                            const VideoPlayPauseToggled(),
                          ),
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          state.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 32,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    const Icon(
                      Icons.forward_10,
                      size: 28,
                      color: AppColors.white,
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child: Row(
              children: [
                Text(
                  '2:15',
                  style: AppTypography.bodySmallMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: CourseProgressBar(
                    progress: 0.4,
                    height: 6,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '5:15',
                  style: AppTypography.bodySmallMedium.copyWith(
                    color: AppColors.white,
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
