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

    final words = title.trim().split(' ');
    final highlightWord = words.removeLast();
    final leadingText = words.join(' ');

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, 24, 24, 16 + bottomSafeArea),
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingText.isNotEmpty)
            Text(
              leadingText,
              textAlign: TextAlign.center,
              style: AppTypography.h2Bold,
            ),
          Text(
            highlightWord,
            textAlign: TextAlign.center,
            style: AppTypography.h2Bold.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTypography.bodyLargeRegular.copyWith(
              color: AppColors.neutral600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 40),
          OnboardingPageIndicator(
            pageCount: pageCount,
            currentIndex: currentIndex,
          ),
          const SizedBox(height: 24),
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
