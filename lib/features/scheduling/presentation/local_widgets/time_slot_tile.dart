import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/time_slot_entity.dart';

class TimeSlotTile extends StatelessWidget {
  final TimeSlotEntity slot;
  final bool isSelected;
  final VoidCallback? onTap;

  const TimeSlotTile({
    super.key,
    required this.slot,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: slot.isAvailable ? onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : AppColors.white,
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : slot.isAvailable
                    ? AppColors.neutral300
                    : AppColors.neutral200,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppColors.inputDropShadow,
        ),
        child: Text(
          slot.label,
          style: AppTypography.bodyLargeMedium.copyWith(
            color: isSelected
                ? AppColors.white
                : slot.isAvailable
                    ? AppColors.neutral900
                    : AppColors.neutral400,
          ),
        ),
      ),
    );
  }
}
