import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/message_entity.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({required List<MessageEntity> initialMessages})
      : super(ChatState(messages: initialMessages)) {
    on<ChatMessageSent>(_onMessageSent);
  }

  void _onMessageSent(ChatMessageSent event, Emitter<ChatState> emit) {
    if (event.text.trim().isEmpty) return;

    emit(
      state.copyWith(
        messages: [
          ...state.messages,
          MessageEntity(text: event.text, time: 'Just now', isOutgoing: true),
        ],
      ),
    );
  }
}
