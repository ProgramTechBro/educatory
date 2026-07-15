import 'package:flutter_bloc/flutter_bloc.dart';
import 'course_detail_event.dart';
import 'course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailState()) {
    on<CourseDetailTabChanged>(
      (event, emit) => emit(state.copyWith(activeTab: event.tab)),
    );
  }
}
