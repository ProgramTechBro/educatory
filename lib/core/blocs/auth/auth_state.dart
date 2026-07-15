import 'package:equatable/equatable.dart';

enum AuthStatus { unknown, firstLaunch, returningUser }

class AuthState extends Equatable {
  final AuthStatus status;

  const AuthState({this.status = AuthStatus.unknown});

  AuthState copyWith({AuthStatus? status}) {
    return AuthState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
