import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../domain/entities/quiz_question_entity.dart';

class QuizState extends Equatable {
  final List<QuizQuestionEntity> questions;
  final int currentIndex;
  final Map<int, Set<int>> selectedAnswers;
  final bool isCompleted;

  const QuizState({
    required this.questions,
    this.currentIndex = 0,
    this.selectedAnswers = const {},
    this.isCompleted = false,
  });

  QuizQuestionEntity get currentQuestion => questions[currentIndex];

  Set<int> get currentSelection => selectedAnswers[currentIndex] ?? const {};

  bool get isLastQuestion => currentIndex == questions.length - 1;

  int get score {
    var correct = 0;
    for (var i = 0; i < questions.length; i++) {
      final selected = selectedAnswers[i] ?? const {};
      if (setEquals(selected, questions[i].correctOptionIndexes)) {
        correct++;
      }
    }
    return correct;
  }

  QuizState copyWith({
    int? currentIndex,
    Map<int, Set<int>>? selectedAnswers,
    bool? isCompleted,
  }) {
    return QuizState(
      questions: questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        questions,
        currentIndex,
        selectedAnswers,
        isCompleted,
      ];
}
