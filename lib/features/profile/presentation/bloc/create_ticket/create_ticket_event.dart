import 'package:equatable/equatable.dart';

abstract class CreateTicketEvent extends Equatable {
  const CreateTicketEvent();

  @override
  List<Object?> get props => [];
}

class CreateTicketSubjectChanged extends CreateTicketEvent {
  final String subject;

  const CreateTicketSubjectChanged(this.subject);

  @override
  List<Object?> get props => [subject];
}

class CreateTicketPriorityChanged extends CreateTicketEvent {
  final String priority;

  const CreateTicketPriorityChanged(this.priority);

  @override
  List<Object?> get props => [priority];
}
