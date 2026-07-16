import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/support_ticket_entity.dart';
import 'support_ticket_detail_event.dart';
import 'support_ticket_detail_state.dart';

class SupportTicketDetailBloc
    extends Bloc<SupportTicketDetailEvent, SupportTicketDetailState> {
  SupportTicketDetailBloc({
    required List<SupportTicketMessageEntity> initialMessages,
  }) : super(SupportTicketDetailState(messages: initialMessages)) {
    on<SupportTicketReplySent>(_onReplySent);
  }

  void _onReplySent(
    SupportTicketReplySent event,
    Emitter<SupportTicketDetailState> emit,
  ) {
    if (event.text.trim().isEmpty) return;

    emit(
      state.copyWith(
        messages: [
          ...state.messages,
          SupportTicketMessageEntity(
            body: event.text,
            timeAgo: 'Just now',
            updatedBy: 'Robert Fox (You)',
          ),
        ],
      ),
    );
  }
}
