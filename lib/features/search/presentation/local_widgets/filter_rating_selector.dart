import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class FilterRatingSelector extends StatelessWidget {
  final int selectedStars;
  final ValueChanged<int> onChanged;

  const FilterRatingSelector({
    super.key,
    required this.selectedStars,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rating',
          style: AppTypography.bodyLargeMedium.copyWith(
            color: AppColors.neutral900,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.neutral300),
            borderRadius: BorderRadius.circular(10),
            boxShadow: AppColors.inputDropShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(5, (index) {
                  final starValue = index + 1;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () => onChanged(starValue),
                      child: Icon(
                        starValue <= selectedStars
                            ? Icons.star
                            : Icons.star_border,
                        size: 20,
                        color: AppColors.orange500,
                      ),
                    ),
                  );
                }),
              ),
              Text(
                '$selectedStars Stars and up',
                style: AppTypography.bodyLargeMedium.copyWith(
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
