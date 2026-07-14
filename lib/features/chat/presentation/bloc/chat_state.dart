import 'package:equatable/equatable.dart';
import '../../../../core/enums/request_status.dart';
import '../../domain/entities/message_entity.dart';

class ChatState extends Equatable {
  final RequestStatus status;
  final List<MessageEntity> messages;
  final String? errorMessage;

  const ChatState({
    this.status = RequestStatus.initial,
    this.messages = const [],
    this.errorMessage,
  });

  ChatState copyWith({
    RequestStatus? status,
    List<MessageEntity>? messages,
    String? errorMessage,
  }) {
    return ChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, messages, errorMessage];
}
