import 'package:equatable/equatable.dart';

class SessionTimerState extends Equatable {
  final int totalSeconds;
  final int remainingSeconds;

  const SessionTimerState({
    required this.totalSeconds,
    required this.remainingSeconds,
  });

  bool get isComplete => remainingSeconds <= 0;

  double get progress =>
      totalSeconds == 0 ? 0 : remainingSeconds / totalSeconds;

  String get formattedTime {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  SessionTimerState copyWith({int? remainingSeconds}) {
    return SessionTimerState(
      totalSeconds: totalSeconds,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }

  @override
  List<Object?> get props => [totalSeconds, remainingSeconds];
}
