import 'package:flutter_bloc/flutter_bloc.dart';
import 'two_step_verification_event.dart';
import 'two_step_verification_state.dart';

class TwoStepVerificationBloc
    extends Bloc<TwoStepVerificationEvent, TwoStepVerificationState> {
  TwoStepVerificationBloc() : super(const TwoStepVerificationState()) {
    on<TwoStepVerificationToggled>(
      (event, emit) => emit(state.copyWith(isEnabled: event.isEnabled)),
    );
  }
}
