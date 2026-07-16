import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
}

class QuizOptionToggled extends QuizEvent {
  final int optionIndex;

  const QuizOptionToggled(this.optionIndex);

  @override
  List<Object?> get props => [optionIndex];
}

class QuizNextRequested extends QuizEvent {
  const QuizNextRequested();
}
