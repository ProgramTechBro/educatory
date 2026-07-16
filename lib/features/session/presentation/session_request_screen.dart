import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import '../../live_tutoring/data/datasources/live_tutoring_local_datasource.dart';
import 'local_widgets/contact_status_card.dart';
import 'local_widgets/session_confirm_dialog.dart';

class SessionRequestScreen extends StatelessWidget {
  const SessionRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tutor = LiveTutoringLocalDataSource().getSubjectTutors().first;

    return Scaffold(
      backgroundColor: AppColors.white,
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
          'Request a Session',
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral900,
          ),
        ),
      ),
      bottomNavigationBar: TwoButtonBottomBar(
        leadingLabel: 'Cancel',
        onLeadingTap: () => context.pop(),
        trailingLabel: 'Start Session',
        onTrailingTap: () async {
          final confirmed = await SessionConfirmDialog.show(
            context,
            tutor.name,
          );
          if (confirmed == true && context.mounted) {
            context.pushReplacement(AppRoutes.sessionProcessing);
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactStatusCard(tutor: tutor),
            const SizedBox(height: 32),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppIcons.sessionRequestIllustration,
                      height: 170,
                    ),
                    const SizedBox(height: 32),
                    Text('Start a Session', style: AppTypography.h3SemiBold),
                    const SizedBox(height: 8),
                    Text(
                      '${tutor.name} is online now. You can send a '
                      'request to start the session for 1 hour',
                      textAlign: TextAlign.center,
                      style: AppTypography.bodyLargeRegular.copyWith(
                        color: AppColors.neutral600,
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
