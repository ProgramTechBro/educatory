import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../config/app_typography.dart';

class FilterChipRow extends StatelessWidget {
  final String label;
  final List<String> options;
  final String selected;
  final ValueChanged<String> onChanged;

  const FilterChipRow({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodyLargeMedium.copyWith(
            color: AppColors.neutral900,
          ),
        ),
        const SizedBox(height: 6),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final option in options) ...[
                _Chip(
                  label: option,
                  isSelected: option == selected,
                  onTap: () => onChanged(option),
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _Chip({
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.buttonGlassBorder : AppColors.neutral300,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: AppColors.inputDropShadow,
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
