import 'package:equatable/equatable.dart';

abstract class DeleteAccountEvent extends Equatable {
  const DeleteAccountEvent();

  @override
  List<Object?> get props => [];
}

class DeleteAccountReasonChanged extends DeleteAccountEvent {
  final String reason;

  const DeleteAccountReasonChanged(this.reason);

  @override
  List<Object?> get props => [reason];
}
