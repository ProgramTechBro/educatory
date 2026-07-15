import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import 'onboarding_action_button.dart';
import 'onboarding_page_indicator.dart';

class OnboardingBottomPanel extends StatelessWidget {
  final String title;
  final String subtitle;
  final int pageCount;
  final int currentIndex;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const OnboardingBottomPanel({
    super.key,
    required this.title,
    required this.subtitle,
    required this.pageCount,
    required this.currentIndex,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final bool showPrevious = currentIndex > 0;
    final double bottomSafeArea = MediaQuery.of(context).padding.bottom;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, 10, 24, 16 + bottomSafeArea),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.gradientOnboardingPanel,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTypography.h3SemiBold.copyWith(color: AppColors.accent,fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTypography.bodyLargeRegular.copyWith(
              color: AppColors.neutral600,
              fontSize: 16
            ),
          ),
          const SizedBox(height: 100),
          OnboardingPageIndicator(
            pageCount: pageCount,
            currentIndex: currentIndex,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              if (showPrevious) ...[
                Expanded(
                  child: OnboardingActionButton(
                    label: 'Previous',
                    onPressed: onPrevious,
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: OnboardingActionButton(
                  label: 'Next',
                  onPressed: onNext,
                  isPrimary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
