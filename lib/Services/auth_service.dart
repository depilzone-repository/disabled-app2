import 'package:flutter_auth/Models/usuario_model.dart';

class AuthService {
  Usuario? _authenticatedUser;

  Future<bool> login(String username, String password) async {
    // Lógica de autenticación (puedes comparar con una lista de usuarios registrados)
    // Retorna true si la autenticación es exitosa, de lo contrario false.

    _authenticatedUser = Usuario();
    
    _authenticatedUser?.id = "dasdfasdf";
    _authenticatedUser?.firstname = "Yosel Edwin";
    _authenticatedUser?.lastname = "Aguirre Balbin";

    return true;
  }

  Usuario? get authenticatedUser => _authenticatedUser;

}
