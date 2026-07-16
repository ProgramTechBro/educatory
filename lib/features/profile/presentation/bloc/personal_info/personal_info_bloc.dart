import 'package:flutter_bloc/flutter_bloc.dart';
import 'personal_info_event.dart';
import 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(const PersonalInfoState()) {
    on<PersonalInfoMajorChanged>(
      (event, emit) => emit(state.copyWith(major: event.major)),
    );
    on<PersonalInfoUniversityChanged>(
      (event, emit) => emit(state.copyWith(university: event.university)),
    );
  }
}
