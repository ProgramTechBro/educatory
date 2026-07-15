import '../../domain/entities/quiz_question_entity.dart';

class QuizLocalDataSource {
  List<QuizQuestionEntity> getQuizQuestions() {
    return const [
      QuizQuestionEntity(
        question:
            'What is the primary purpose of analytical thinking in '
            'responsive design?',
        type: QuizQuestionType.singleChoice,
        options: [
          'To make interfaces look colorful',
          'To break down complex layout problems and evaluate solutions '
              'logically',
          'To write CSS faster',
          'To avoid using media queries',
        ],
        correctOptionIndexes: {1},
      ),
      QuizQuestionEntity(
        question:
            'Which of the following are key components of analytical '
            'thinking? (Select all that apply)',
        type: QuizQuestionType.multipleChoice,
        options: [
          'Identifying patterns',
          'Breaking down complex information',
          'Guessing without evaluation',
          'Making informed decisions',
        ],
        correctOptionIndexes: {0, 1, 3},
      ),
    ];
  }
}
