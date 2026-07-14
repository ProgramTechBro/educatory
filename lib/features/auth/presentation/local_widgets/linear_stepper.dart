import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';

class LinearStepper extends StatelessWidget {
  final int stepCount;
  final int currentStep;

  const LinearStepper({
    super.key,
    required this.stepCount,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(stepCount, (index) {
        final bool isCompleted = index <= currentStep;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: index == stepCount - 1 ? 0 : 8),
            height: 6,
            decoration: BoxDecoration(
              color: isCompleted ? AppColors.accent : AppColors.neutral200,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        );
      }),
    );
  }
}
