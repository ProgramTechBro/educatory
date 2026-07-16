import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/search_target.dart';

class SearchTargetToggle extends StatelessWidget {
  final SearchTarget target;
  final ValueChanged<SearchTarget> onChanged;

  const SearchTargetToggle({
    super.key,
    required this.target,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm looking for",
          style: AppTypography.bodyLargeMedium.copyWith(
            color: AppColors.neutral900,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _Segment(
                label: 'Tutors',
                isSelected: target == SearchTarget.tutors,
                onTap: () => onChanged(SearchTarget.tutors),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _Segment(
                label: 'Course',
                isSelected: target == SearchTarget.courses,
                onTap: () => onChanged(SearchTarget.courses),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Segment extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _Segment({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.buttonGlassBorder : AppColors.neutral300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: AppTypography.bodyLargeMedium.copyWith(
            color: isSelected ? AppColors.white : AppColors.neutral500,
          ),
        ),
      ),
    );
  }
}
