enum QuizQuestionType { singleChoice, multipleChoice }

class QuizQuestionEntity {
  final String question;
  final QuizQuestionType type;
  final List<String> options;
  final Set<int> correctOptionIndexes;

  const QuizQuestionEntity({
    required this.question,
    required this.type,
    required this.options,
    required this.correctOptionIndexes,
  });
}
