import 'package:flutter/material.dart';
import 'package:flutter_auth/shared/models/Usuario.dart';
import 'package:flutter_auth/shared/services/shared_pref.dart';

class AppProvider extends ChangeNotifier {

  bool _isLogged = false;
  String _text = 'Iniciando...';
  Usuario? _usuario;
  Auth? _auth;

  String get text => _text;
  bool get isLogged => _isLogged;
  Usuario? get usuario => _usuario;
  Auth? get auth => _auth;

  SharedPref sharedPref = SharedPref();

  /// Updates
  Future<void> updateText(String newText) async {
    _text = newText;
    notifyListeners();
  }

  Future<void> updateLogged(bool value) async {
    _isLogged = value;
    notifyListeners();
  }

  Future<void> updateUsuario(Usuario? value) async {
    _usuario = value;
    notifyListeners();
  }

  Future<void> updateAuth(Auth? value) async {
    _auth = value;
    notifyListeners();
  }


  Future<void> fetchData() async {
    print('This executes');

    // Simulamos una operación asíncrona, como una llamada a una API
    await Future.delayed(const Duration(seconds: 5));

    // Actualizamos el valor
    await updateText("Validando...");

    Usuario usuario = Usuario.fromJson(await sharedPref.read("user"));
    await updateUsuario( usuario );
    print('Usuario actualizado');

    Auth auth = Auth.fromJson(await sharedPref.read("auth"));
    await updateAuth( auth );
    print('Auth autorizado');

    await Future.delayed(const Duration(seconds: 5));

    print('This not executes');
  }


}

