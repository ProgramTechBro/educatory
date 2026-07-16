import 'package:equatable/equatable.dart';

abstract class SupportTicketDetailEvent extends Equatable {
  const SupportTicketDetailEvent();

  @override
  List<Object?> get props => [];
}

class SupportTicketReplySent extends SupportTicketDetailEvent {
  final String text;

  const SupportTicketReplySent(this.text);

  @override
  List<Object?> get props => [text];
}
