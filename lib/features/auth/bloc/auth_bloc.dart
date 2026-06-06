import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));

      // Validation
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(AuthFailure(message: 'Please enter email and password'));
        return;
      }
      if (!event.email.contains('@')) {
        emit(AuthFailure(message: 'Please enter a valid email address'));
        return;
      }
      if (event.password.length < 6) {
        emit(AuthFailure(message: 'Password must be at least 6 characters'));
        return;
      }

      // Success
      emit(AuthSuccess(email: event.email));
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));

      if (event.name.isEmpty || event.email.isEmpty || event.password.isEmpty) {
        emit(AuthFailure(message: 'Please fill all fields'));
        return;
      }
      if (!event.email.contains('@')) {
        emit(AuthFailure(message: 'Please enter a valid email address'));
        return;
      }
      if (event.password.length < 6) {
        emit(AuthFailure(message: 'Password must be at least 6 characters'));
        return;
      }

      emit(AuthSignUpSuccess());
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthInitial());
    });
  }
}