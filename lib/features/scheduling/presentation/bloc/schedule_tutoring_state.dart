import 'package:equatable/equatable.dart';

class ScheduleTutoringState extends Equatable {
  final bool isOnline;
  final DateTime visibleMonth;
  final DateTime? selectedDate;
  final int? selectedSlotIndex;

  const ScheduleTutoringState({
    this.isOnline = true,
    required this.visibleMonth,
    this.selectedDate,
    this.selectedSlotIndex,
  });

  bool get isReadyToContinue => selectedDate != null && selectedSlotIndex != null;

  ScheduleTutoringState copyWith({
    bool? isOnline,
    DateTime? visibleMonth,
    DateTime? selectedDate,
    int? selectedSlotIndex,
  }) {
    return ScheduleTutoringState(
      isOnline: isOnline ?? this.isOnline,
      visibleMonth: visibleMonth ?? this.visibleMonth,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedSlotIndex: selectedSlotIndex ?? this.selectedSlotIndex,
    );
  }

  @override
  List<Object?> get props => [
        isOnline,
        visibleMonth,
        selectedDate,
        selectedSlotIndex,
      ];
}
