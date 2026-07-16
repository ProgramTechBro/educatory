import 'package:flutter_bloc/flutter_bloc.dart';
import 'session_rating_event.dart';
import 'session_rating_state.dart';

class SessionRatingBloc extends Bloc<SessionRatingEvent, SessionRatingState> {
  SessionRatingBloc() : super(const SessionRatingState()) {
    on<SessionRatingChanged>(
      (event, emit) => emit(state.copyWith(rating: event.rating)),
    );
  }
}
