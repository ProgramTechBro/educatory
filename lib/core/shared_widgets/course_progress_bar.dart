import 'package:flutter/material.dart';
import '../../config/app_colors.dart';

class CourseProgressBar extends StatelessWidget {
  final double progress;
  final double width;
  final double height;
  final Color color;

  const CourseProgressBar({
    super.key,
    required this.progress,
    this.width = double.infinity,
    this.height = 12,
    this.color = AppColors.green600,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final trackWidth = width == double.infinity
            ? constraints.maxWidth
            : width;
        return Container(
          width: trackWidth,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.neutral200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress.clamp(0, 1),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: AppColors.buttonGlassBorder),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
