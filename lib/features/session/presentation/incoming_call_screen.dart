import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../routes/app_routes.dart';
import '../../live_tutoring/data/datasources/live_tutoring_local_datasource.dart';

class IncomingCallScreen extends StatelessWidget {
  const IncomingCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tutor = LiveTutoringLocalDataSource().getSubjectTutors().first;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: tutor.avatar,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(tutor.name, style: AppTypography.h3Bold),
                      const SizedBox(height: 4),
                      Text(
                        'is video calling you...',
                        style: AppTypography.bodyLargeRegular.copyWith(
                          color: AppColors.neutral600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CallActionButton(
                      icon: Icons.call_end,
                      backgroundColor: AppColors.callDeclineRed,
                      padding: 12,
                      onTap: () => context.pop(),
                    ),
                    _CallActionButton(
                      icon: Icons.videocam,
                      backgroundColor: AppColors.callAcceptGreen,
                      padding: 16,
                      onTap: () =>
                          context.pushReplacement(AppRoutes.videoCall),
                    ),
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

class _CallActionButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final double padding;
  final VoidCallback onTap;

  const _CallActionButton({
    required this.icon,
    required this.backgroundColor,
    required this.padding,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 32, color: AppColors.white),
      ),
    );
  }
}
