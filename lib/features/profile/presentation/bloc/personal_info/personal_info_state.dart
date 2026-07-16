import 'package:equatable/equatable.dart';

class PersonalInfoState extends Equatable {
  final String major;
  final String university;

  const PersonalInfoState({
    this.major = 'Computer Science Engineering',
    this.university = 'University of Philadelphia',
  });

  PersonalInfoState copyWith({String? major, String? university}) {
    return PersonalInfoState(
      major: major ?? this.major,
      university: university ?? this.university,
    );
  }

  @override
  List<Object?> get props => [major, university];
}
