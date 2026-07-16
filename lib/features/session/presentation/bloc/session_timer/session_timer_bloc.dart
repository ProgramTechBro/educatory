import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'session_timer_event.dart';
import 'session_timer_state.dart';

class SessionTimerBloc extends Bloc<SessionTimerEvent, SessionTimerState> {
  static const _totalSeconds = 649;
  static const _secondsPerTick = 10;

  late final Timer _ticker;

  SessionTimerBloc()
      : super(
          const SessionTimerState(
            totalSeconds: _totalSeconds,
            remainingSeconds: _totalSeconds,
          ),
        ) {
    on<SessionTimerTicked>(_onTicked);
    _ticker = Timer.periodic(
      const Duration(milliseconds: 200),
      (_) => add(const SessionTimerTicked()),
    );
  }

  void _onTicked(SessionTimerTicked event, Emitter<SessionTimerState> emit) {
    if (state.isComplete) {
      _ticker.cancel();
      return;
    }
    final remaining = state.remainingSeconds - _secondsPerTick;
    emit(state.copyWith(remainingSeconds: remaining < 0 ? 0 : remaining));
    if (remaining <= 0) {
      _ticker.cancel();
    }
  }

  @override
  Future<void> close() {
    _ticker.cancel();
    return super.close();
  }
}
