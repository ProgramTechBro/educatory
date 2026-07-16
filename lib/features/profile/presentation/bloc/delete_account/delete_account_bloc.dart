import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_account_event.dart';
import 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc() : super(const DeleteAccountState()) {
    on<DeleteAccountReasonChanged>(
      (event, emit) => emit(state.copyWith(reason: event.reason)),
    );
  }
}
