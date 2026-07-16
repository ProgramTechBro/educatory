import 'package:flutter_bloc/flutter_bloc.dart';
import 'schedule_tutoring_event.dart';
import 'schedule_tutoring_state.dart';

class ScheduleTutoringBloc
    extends Bloc<ScheduleTutoringEvent, ScheduleTutoringState> {
  ScheduleTutoringBloc()
      : super(ScheduleTutoringState(visibleMonth: DateTime(2026, 2, 1))) {
    on<ScheduleOnlineToggled>(
      (event, emit) => emit(state.copyWith(isOnline: event.isOnline)),
    );
    on<ScheduleMonthChanged>((event, emit) {
      final current = state.visibleMonth;
      emit(
        state.copyWith(
          visibleMonth: DateTime(current.year, current.month + event.monthDelta),
        ),
      );
    });
    on<ScheduleDateSelected>(
      (event, emit) => emit(
        ScheduleTutoringState(
          isOnline: state.isOnline,
          visibleMonth: state.visibleMonth,
          selectedDate: event.date,
          selectedSlotIndex: null,
        ),
      ),
    );
    on<ScheduleSlotSelected>(
      (event, emit) => emit(state.copyWith(selectedSlotIndex: event.slotIndex)),
    );
  }
}
