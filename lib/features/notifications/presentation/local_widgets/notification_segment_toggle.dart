import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class NotificationSegmentToggle extends StatelessWidget {
  final bool showUnreadOnly;
  final ValueChanged<bool> onChanged;

  const NotificationSegmentToggle({
    super.key,
    required this.showUnreadOnly,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.neutral200),
          bottom: BorderSide(color: AppColors.neutral200),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _SegmentButton(
            label: 'Unread',
            isSelected: showUnreadOnly,
            onTap: () => onChanged(true),
          ),
          _SegmentButton(
            label: 'All',
            isSelected: !showUnreadOnly,
            onTap: () => onChanged(false),
          ),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SegmentButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 24,
        constraints: const BoxConstraints(minWidth: 56),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : AppColors.white,
          border: isSelected
              ? Border.all(color: AppColors.buttonGlassBorder)
              : null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: AppTypography.bodySmallMedium.copyWith(
            color: isSelected ? AppColors.white : AppColors.neutral600,
          ),
        ),
      ),
    );
  }
}
