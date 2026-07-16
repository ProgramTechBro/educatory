import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class ResultsSearchBar extends StatelessWidget {
  final int filterCount;
  final VoidCallback onFilterTap;

  const ResultsSearchBar({
    super.key,
    required this.filterCount,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.neutral300),
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.search, size: 20, color: AppColors.neutral500),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              style: AppTypography.bodyLargeRegular.copyWith(
                color: AppColors.neutral900,
              ),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                hintText: 'Search a course...',
                hintStyle: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onFilterTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: AppColors.neutral300)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.tune, size: 20, color: AppColors.neutral500),
                  const SizedBox(width: 8),
                  Text(
                    '$filterCount Filters',
                    style: AppTypography.bodyLargeMedium.copyWith(
                      color: AppColors.neutral500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
