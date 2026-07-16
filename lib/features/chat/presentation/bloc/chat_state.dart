import 'package:equatable/equatable.dart';
import '../../domain/entities/message_entity.dart';

class ChatState extends Equatable {
  final List<MessageEntity> messages;

  const ChatState({this.messages = const []});

  ChatState copyWith({List<MessageEntity>? messages}) {
    return ChatState(messages: messages ?? this.messages);
  }

  @override
  List<Object?> get props => [messages];
}
