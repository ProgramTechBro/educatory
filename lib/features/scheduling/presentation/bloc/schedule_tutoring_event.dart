import 'package:equatable/equatable.dart';

abstract class ScheduleTutoringEvent extends Equatable {
  const ScheduleTutoringEvent();

  @override
  List<Object?> get props => [];
}

class ScheduleOnlineToggled extends ScheduleTutoringEvent {
  final bool isOnline;

  const ScheduleOnlineToggled(this.isOnline);

  @override
  List<Object?> get props => [isOnline];
}

class ScheduleMonthChanged extends ScheduleTutoringEvent {
  final int monthDelta;

  const ScheduleMonthChanged(this.monthDelta);

  @override
  List<Object?> get props => [monthDelta];
}

class ScheduleDateSelected extends ScheduleTutoringEvent {
  final DateTime date;

  const ScheduleDateSelected(this.date);

  @override
  List<Object?> get props => [date];
}

class ScheduleSlotSelected extends ScheduleTutoringEvent {
  final int slotIndex;

  const ScheduleSlotSelected(this.slotIndex);

  @override
  List<Object?> get props => [slotIndex];
}
