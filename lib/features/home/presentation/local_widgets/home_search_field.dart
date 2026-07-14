import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

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
                hintText: 'Search',
                hintStyle: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: AppColors.neutral300)),
            ),
            child: const Icon(Icons.tune, size: 20, color: AppColors.neutral500),
          ),
        ],
      ),
    );
  }
}
