import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_ticket_event.dart';
import 'create_ticket_state.dart';

class CreateTicketBloc extends Bloc<CreateTicketEvent, CreateTicketState> {
  CreateTicketBloc() : super(const CreateTicketState()) {
    on<CreateTicketSubjectChanged>(
      (event, emit) => emit(state.copyWith(subject: event.subject)),
    );
    on<CreateTicketPriorityChanged>(
      (event, emit) => emit(state.copyWith(priority: event.priority)),
    );
  }
}
