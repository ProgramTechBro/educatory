import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentIndex;

  const OnboardingPageIndicator({
    super.key,
    required this.pageCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(pageCount, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: isActive ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : Colors.transparent,
            border: isActive
                ? null
                : Border.all(color: AppColors.purple100, width: 1.5),
            borderRadius: BorderRadius.circular(100),
          ),
        );
      }),
    );
  }
}
