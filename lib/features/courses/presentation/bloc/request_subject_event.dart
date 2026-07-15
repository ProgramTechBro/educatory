import 'package:equatable/equatable.dart';

abstract class RequestSubjectEvent extends Equatable {
  const RequestSubjectEvent();

  @override
  List<Object?> get props => [];
}

class RequestSubjectCategoryChanged extends RequestSubjectEvent {
  final String value;
  const RequestSubjectCategoryChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class RequestSubjectLevelChanged extends RequestSubjectEvent {
  final String value;
  const RequestSubjectLevelChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class RequestSubjectUrgencyChanged extends RequestSubjectEvent {
  final String value;
  const RequestSubjectUrgencyChanged(this.value);

  @override
  List<Object?> get props => [value];
}
