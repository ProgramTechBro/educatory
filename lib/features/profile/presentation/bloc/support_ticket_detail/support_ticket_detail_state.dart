import 'package:equatable/equatable.dart';
import '../../../domain/entities/support_ticket_entity.dart';

class SupportTicketDetailState extends Equatable {
  final List<SupportTicketMessageEntity> messages;

  const SupportTicketDetailState({this.messages = const []});

  SupportTicketDetailState copyWith({
    List<SupportTicketMessageEntity>? messages,
  }) {
    return SupportTicketDetailState(messages: messages ?? this.messages);
  }

  @override
  List<Object?> get props => [messages];
}
