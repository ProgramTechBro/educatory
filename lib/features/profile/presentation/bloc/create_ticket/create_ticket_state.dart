import 'package:equatable/equatable.dart';

class CreateTicketState extends Equatable {
  final String? subject;
  final String? priority;

  const CreateTicketState({this.subject, this.priority});

  CreateTicketState copyWith({String? subject, String? priority}) {
    return CreateTicketState(
      subject: subject ?? this.subject,
      priority: priority ?? this.priority,
    );
  }

  @override
  List<Object?> get props => [subject, priority];
}
