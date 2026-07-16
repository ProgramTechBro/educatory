import 'package:equatable/equatable.dart';

class DeleteAccountState extends Equatable {
  final String reason;

  const DeleteAccountState({this.reason = "I don't need this anymore"});

  DeleteAccountState copyWith({String? reason}) {
    return DeleteAccountState(reason: reason ?? this.reason);
  }

  @override
  List<Object?> get props => [reason];
}
