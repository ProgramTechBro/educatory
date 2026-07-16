import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class ScheduleOnlineCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const ScheduleOnlineCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isChecked),
      borderRadius: BorderRadius.circular(6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isChecked ? AppColors.accent : AppColors.white,
              border: Border.all(
                color: isChecked ? Colors.transparent : const Color(0xFFD0D5DD),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: isChecked
                ? const Icon(Icons.check, size: 16, color: AppColors.white)
                : null,
          ),
          const SizedBox(width: 8),
          Text(
            'I will study online',
            style: AppTypography.bodyLargeRegular.copyWith(
              color: AppColors.neutral600,
            ),
          ),
        ],
      ),
    );
  }
}
