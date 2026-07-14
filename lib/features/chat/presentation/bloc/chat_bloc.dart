import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/request_status.dart';
import '../../domain/usecases/get_messages_usecase.dart';
import '../../domain/usecases/send_message_usecase.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetMessagesUseCase getMessages;
  final SendMessageUseCase sendMessage;

  ChatBloc({required this.getMessages, required this.sendMessage})
      : super(const ChatState()) {
    on<ChatMessagesRequested>(_onMessagesRequested);
    on<ChatMessageSent>(_onMessageSent);
  }

  Future<void> _onMessagesRequested(
      ChatMessagesRequested event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
  }

  Future<void> _onMessageSent(
      ChatMessageSent event, Emitter<ChatState> emit) async {}
}
