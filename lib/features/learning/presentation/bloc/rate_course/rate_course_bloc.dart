import 'package:flutter_bloc/flutter_bloc.dart';
import 'rate_course_event.dart';
import 'rate_course_state.dart';

class RateCourseBloc extends Bloc<RateCourseEvent, RateCourseState> {
  RateCourseBloc() : super(const RateCourseState()) {
    on<RateCourseRatingChanged>(
      (event, emit) => emit(state.copyWith(rating: event.rating)),
    );
  }
}
