import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../domain/entities/quiz_question_entity.dart';

class QuizOptionTile extends StatelessWidget {
  final String label;
  final bool isSelected;
  final QuizQuestionType type;
  final VoidCallback onTap;

  const QuizOptionTile({
    super.key,
    required this.label,
    required this.isSelected,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSingleChoice = type == QuizQuestionType.singleChoice;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondaryButtonFill : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.neutral300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              isSingleChoice
                  ? (isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off)
                  : (isSelected
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
              size: 20,
              color: isSelected ? AppColors.primary : AppColors.neutral300,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
