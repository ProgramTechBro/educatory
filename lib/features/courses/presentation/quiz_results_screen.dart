import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import '../domain/entities/quiz_question_entity.dart';

class QuizResultsScreen extends StatelessWidget {
  final List<QuizQuestionEntity> questions;
  final Map<int, Set<int>> answers;
  final int score;

  const QuizResultsScreen({
    super.key,
    required this.questions,
    required this.answers,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final total = questions.length;
    final passed = score >= (total / 2);

    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: TwoButtonBottomBar(
        leadingLabel: 'View Answers',
        onLeadingTap: () => context.push(
          AppRoutes.quizAnswers,
          extra: {'questions': questions, 'answers': answers},
        ),
        trailingLabel: 'Finish',
        onTrailingTap: () => context.go(AppRoutes.myCourses),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: passed ? AppColors.green50 : AppColors.red50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                passed ? Icons.check_circle : Icons.cancel,
                size: 64,
                color: passed ? AppColors.green600 : AppColors.red500,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              passed ? 'Quiz Passed!' : 'Quiz Failed',
              style: AppTypography.h3Bold,
            ),
            const SizedBox(height: 8),
            Text(
              'You scored $score out of $total',
              style: AppTypography.bodyLargeRegular.copyWith(
                color: AppColors.neutral600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
