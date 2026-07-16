import 'package:equatable/equatable.dart';

abstract class PersonalInfoEvent extends Equatable {
  const PersonalInfoEvent();

  @override
  List<Object?> get props => [];
}

class PersonalInfoMajorChanged extends PersonalInfoEvent {
  final String major;

  const PersonalInfoMajorChanged(this.major);

  @override
  List<Object?> get props => [major];
}

class PersonalInfoUniversityChanged extends PersonalInfoEvent {
  final String university;

  const PersonalInfoUniversityChanged(this.university);

  @override
  List<Object?> get props => [university];
}
