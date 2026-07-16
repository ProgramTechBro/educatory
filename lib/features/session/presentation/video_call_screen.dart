import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import 'local_widgets/session_rating_sheet.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  Future<void> _endCall(BuildContext context) async {
    await SessionRatingSheet.show(context);
    if (context.mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.videoCallBackground, fit: BoxFit.cover),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  'Ending 00:59:36',
                  style: AppTypography.bodyLargeMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            bottom: 44,
            child: Column(
              children: [
                Container(
                  width: 44,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CallControlButton(
                      icon: Icons.mic_none_outlined,
                      onTap: () {},
                    ),
                    _CallControlButton(
                      icon: Icons.videocam_off_outlined,
                      onTap: () {},
                    ),
                    _CallControlButton(
                      icon: Icons.cameraswitch_outlined,
                      onTap: () {},
                    ),
                    _CallControlButton(
                      icon: Icons.call_end,
                      backgroundColor: AppColors.callDeclineRed,
                      onTap: () => _endCall(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CallControlButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final VoidCallback onTap;

  const _CallControlButton({
    required this.icon,
    required this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black.withValues(alpha: 0.35),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 24, color: AppColors.white),
      ),
    );
  }
}
