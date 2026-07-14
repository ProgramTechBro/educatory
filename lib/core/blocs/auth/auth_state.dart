import 'package:equatable/equatable.dart';
import '../../enums/request_status.dart';

class AuthState extends Equatable {
  final RequestStatus status;

  const AuthState({this.status = RequestStatus.initial});

  AuthState copyWith({RequestStatus? status}) {
    return AuthState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
