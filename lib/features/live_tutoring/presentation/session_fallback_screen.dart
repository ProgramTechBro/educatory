import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/live_tutoring_local_datasource.dart';

class SessionFallbackScreen extends StatelessWidget {
  const SessionFallbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tutor = LiveTutoringLocalDataSource().getSubjectTutors().first;

    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: TwoButtonBottomBar(
        leadingLabel: 'Open a Ticket',
        onLeadingTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Support ticket opened')),
          );
        },
        trailingLabel: 'Request Again',
        onTrailingTap: () => context.pushReplacement(AppRoutes.incomingCall),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.sessionFallbackIllustration,
                height: 212,
              ),
              const SizedBox(height: 24),
              Text('Oops! No Response', style: AppTypography.h3SemiBold),
              const SizedBox(height: 8),
              Text(
                "${tutor.name} didn't respond please try requesting again "
                'or open a support ticket',
                textAlign: TextAlign.center,
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
