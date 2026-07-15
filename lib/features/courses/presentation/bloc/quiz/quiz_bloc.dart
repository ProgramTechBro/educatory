import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/quiz_question_entity.dart';
import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({required List<QuizQuestionEntity> questions})
      : super(QuizState(questions: questions)) {
    on<QuizOptionToggled>(_onOptionToggled);
    on<QuizNextRequested>(_onNextRequested);
  }

  void _onOptionToggled(QuizOptionToggled event, Emitter<QuizState> emit) {
    final question = state.currentQuestion;
    final current = Set<int>.from(state.currentSelection);

    if (question.type == QuizQuestionType.singleChoice) {
      current
        ..clear()
        ..add(event.optionIndex);
    } else {
      if (!current.add(event.optionIndex)) {
        current.remove(event.optionIndex);
      }
    }

    final updatedAnswers = Map<int, Set<int>>.from(state.selectedAnswers)
      ..[state.currentIndex] = current;

    emit(state.copyWith(selectedAnswers: updatedAnswers));
  }

  void _onNextRequested(QuizNextRequested event, Emitter<QuizState> emit) {
    if (state.isLastQuestion) {
      emit(state.copyWith(isCompleted: true));
    } else {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    }
  }
}
