import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/local_storage_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LocalStorageService localStorageService;

  AuthBloc({required this.localStorageService}) : super(const AuthState()) {
    on<AuthStarted>(_onStarted);
    on<AuthOnboardingCompleted>(_onOnboardingCompleted);
  }

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    final isComplete = await localStorageService.isOnboardingComplete();
    emit(
      state.copyWith(
        status: isComplete ? AuthStatus.returningUser : AuthStatus.firstLaunch,
      ),
    );
  }

  Future<void> _onOnboardingCompleted(
    AuthOnboardingCompleted event,
    Emitter<AuthState> emit,
  ) async {
    await localStorageService.setOnboardingComplete();
    emit(state.copyWith(status: AuthStatus.returningUser));
  }
}
