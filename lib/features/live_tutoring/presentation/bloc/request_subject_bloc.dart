import 'package:flutter_bloc/flutter_bloc.dart';
import 'request_subject_event.dart';
import 'request_subject_state.dart';

class RequestSubjectBloc
    extends Bloc<RequestSubjectEvent, RequestSubjectState> {
  RequestSubjectBloc() : super(const RequestSubjectState()) {
    on<RequestSubjectCategoryChanged>(
      (event, emit) => emit(state.copyWith(category: event.value)),
    );
    on<RequestSubjectLevelChanged>(
      (event, emit) => emit(state.copyWith(level: event.value)),
    );
    on<RequestSubjectUrgencyChanged>(
      (event, emit) => emit(state.copyWith(urgency: event.value)),
    );
  }
}
