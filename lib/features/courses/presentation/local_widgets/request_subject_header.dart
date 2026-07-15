import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class RequestSubjectHeader extends StatelessWidget {
  const RequestSubjectHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            color: AppColors.purple100,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.auto_awesome_outlined,
            size: 28,
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 16),
        Text("Can't find your subject?", style: AppTypography.h3SemiBold),
        const SizedBox(height: 4),
        Text(
          "Tell us what you're looking for and we'll try to add it soon.",
          style: AppTypography.bodyLargeRegular.copyWith(
            color: AppColors.neutral600,
          ),
        ),
      ],
    );
  }
}
