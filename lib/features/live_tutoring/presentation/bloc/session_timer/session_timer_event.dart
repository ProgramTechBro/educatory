import 'package:equatable/equatable.dart';

abstract class SessionTimerEvent extends Equatable {
  const SessionTimerEvent();

  @override
  List<Object?> get props => [];
}

class SessionTimerTicked extends SessionTimerEvent {
  const SessionTimerTicked();
}
