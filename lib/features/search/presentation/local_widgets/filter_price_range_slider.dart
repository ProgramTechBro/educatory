import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class FilterPriceRangeSlider extends StatelessWidget {
  final String label;
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;

  const FilterPriceRangeSlider({
    super.key,
    required this.label,
    required this.values,
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
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.neutral300,
            trackHeight: 4,
            thumbColor: AppColors.white,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 12,
              elevation: 2,
            ),
            overlayShape: SliderComponentShape.noOverlay,
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 12,
              elevation: 2,
            ),
            valueIndicatorShape: SliderComponentShape.noThumb,
          ),
          child: RangeSlider(
            values: values,
            min: 0,
            max: 50,
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${values.start.round()}',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
              Text(
                '\$${values.end.round()}',
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
