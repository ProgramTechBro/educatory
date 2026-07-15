import 'package:equatable/equatable.dart';

class RequestSubjectState extends Equatable {
  final String? category;
  final String? level;
  final String? urgency;

  const RequestSubjectState({this.category, this.level, this.urgency});

  RequestSubjectState copyWith({
    String? category,
    String? level,
    String? urgency,
  }) {
    return RequestSubjectState(
      category: category ?? this.category,
      level: level ?? this.level,
      urgency: urgency ?? this.urgency,
    );
  }

  @override
  List<Object?> get props => [category, level, urgency];
}
