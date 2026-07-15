import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../domain/entities/quiz_question_entity.dart';

class QuizAnswersScreen extends StatelessWidget {
  final List<QuizQuestionEntity> questions;
  final Map<int, Set<int>> answers;

  const QuizAnswersScreen({
    super.key,
    required this.questions,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.chevron_left,
            size: 24,
            color: AppColors.neutral900,
          ),
        ),
        title: Text(
          'Your Answers',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var q = 0; q < questions.length; q++) ...[
                Text(
                  'Question ${q + 1}/${questions.length}',
                  style: AppTypography.bodySmallMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(questions[q].question, style: AppTypography.h4SemiBold),
                const SizedBox(height: 16),
                for (var i = 0; i < questions[q].options.length; i++) ...[
                  _AnswerOptionRow(
                    label: questions[q].options[i],
                    isCorrect: questions[q].correctOptionIndexes.contains(i),
                    isSelected: (answers[q] ?? const {}).contains(i),
                  ),
                  if (i != questions[q].options.length - 1)
                    const SizedBox(height: 12),
                ],
                if (q != questions.length - 1) ...[
                  const SizedBox(height: 24),
                  const Divider(height: 1, color: AppColors.neutral200),
                  const SizedBox(height: 24),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _AnswerOptionRow extends StatelessWidget {
  final String label;
  final bool isCorrect;
  final bool isSelected;

  const _AnswerOptionRow({
    required this.label,
    required this.isCorrect,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final wrongSelection = isSelected && !isCorrect;

    Color borderColor;
    Color? fillColor;
    IconData? statusIcon;
    Color? statusColor;

    if (isCorrect) {
      borderColor = AppColors.green500;
      fillColor = AppColors.green50;
      statusIcon = Icons.check_circle;
      statusColor = AppColors.green600;
    } else if (wrongSelection) {
      borderColor = AppColors.red500;
      fillColor = AppColors.red50;
      statusIcon = Icons.cancel;
      statusColor = AppColors.red500;
    } else {
      borderColor = AppColors.neutral300;
      fillColor = AppColors.white;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTypography.bodyLargeRegular.copyWith(
                color: AppColors.neutral900,
              ),
            ),
          ),
          if (statusIcon != null) ...[
            const SizedBox(width: 8),
            Icon(statusIcon, size: 20, color: statusColor),
          ],
        ],
      ),
    );
  }
}
