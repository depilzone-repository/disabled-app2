import 'package:bloc/bloc.dart';
import 'package:flutter_auth/Events/auth_event.dart';
import 'package:flutter_auth/Models/usuario_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      // Aquí debes realizar la lógica de autenticación
      // y emitir los estados correspondientes.
      // Puedes usar try-catch para manejar errores.
      // Si la autenticación es exitosa, emite AuthenticatedState,
      // de lo contrario, emite UnauthenticatedState.

      const user = User(username: "dddd", password: "eeeee");

      const AuthenticatedState(user: user);
    }
  }
}