import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/course_detail_tab.dart';

class CourseTabBar extends StatelessWidget {
  final CourseDetailTab activeTab;
  final ValueChanged<CourseDetailTab> onChanged;

  const CourseTabBar({
    super.key,
    required this.activeTab,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.neutral300)),
      ),
      child: Row(
        children: [
          for (final tab in CourseDetailTab.values)
            _TabItem(
              label: tab.label,
              isActive: tab == activeTab,
              onTap: () => onChanged(tab),
            ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? const Color(0xFF3B82F6) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          style: isActive
              ? AppTypography.bodyLargeMedium.copyWith(
                  color: const Color(0xFF3B82F6),
                )
              : AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral500,
                ),
        ),
      ),
    );
  }
}
