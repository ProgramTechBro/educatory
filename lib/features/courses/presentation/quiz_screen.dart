import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../../../core/shared_widgets/course_progress_bar.dart';
import '../../../core/shared_widgets/two_button_bottom_bar.dart';
import '../../../routes/app_routes.dart';
import '../data/datasources/quiz_local_datasource.dart';
import '../domain/entities/quiz_question_entity.dart';
import 'bloc/quiz/quiz_bloc.dart';
import 'bloc/quiz/quiz_event.dart';
import 'bloc/quiz/quiz_state.dart';
import 'local_widgets/quiz_option_tile.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(
        questions: QuizLocalDataSource().getQuizQuestions(),
      ),
      child: const _QuizScreenBody(),
    );
  }
}

class _QuizScreenBody extends StatelessWidget {
  const _QuizScreenBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizBloc, QuizState>(
      listenWhen: (previous, current) =>
          !previous.isCompleted && current.isCompleted,
      listener: (context, state) {
        context.pushReplacement(
          AppRoutes.quizResults,
          extra: {
            'questions': state.questions,
            'answers': state.selectedAnswers,
            'score': state.score,
          },
        );
      },
      child: Scaffold(
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
            'Quiz',
            style: AppTypography.h4Medium.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            return TwoButtonBottomBar(
              trailingLabel: state.isLastQuestion ? 'Submit' : 'Next',
              onTrailingTap: state.currentSelection.isEmpty
                  ? null
                  : () => context.read<QuizBloc>().add(
                        const QuizNextRequested(),
                      ),
            );
          },
        ),
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            final question = state.currentQuestion;

            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                color: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Question ${state.currentIndex + 1}/'
                          '${state.questions.length}',
                          style: AppTypography.bodySmallMedium.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    CourseProgressBar(
                      progress:
                          (state.currentIndex + 1) / state.questions.length,
                      height: 6,
                    ),
                    const SizedBox(height: 20),
                    Text(question.question, style: AppTypography.h4SemiBold),
                    if (question.type == QuizQuestionType.multipleChoice) ...[
                      const SizedBox(height: 4),
                      Text(
                        'Select all that apply',
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    for (var i = 0; i < question.options.length; i++) ...[
                      QuizOptionTile(
                        label: question.options[i],
                        isSelected: state.currentSelection.contains(i),
                        onTap: () => context.read<QuizBloc>().add(
                              QuizOptionToggled(i),
                            ),
                      ),
                      if (i != question.options.length - 1)
                        const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
