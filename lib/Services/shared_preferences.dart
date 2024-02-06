import 'package:flutter_auth/shared/services/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/models/Usuario.dart';



// Función para guardar el estado de inicio de sesión
Future<void> saveLoginState(bool isLoggedIn) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', isLoggedIn);
}


// Función para obtener el estado de inicio de sesión
Future<bool> getLoginState() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}


Future<void> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isLoggedIn', false);
}


Future<Usuario?> getUsuario() async {
  SharedPref sharedPref = SharedPref();
  final usuarioJson = await sharedPref.readJson("user");
  Usuario? usuario = usuarioJson != null ? Usuario.fromJson(usuarioJson) : null;

  return usuario;
}

Future<Auth?> getAuth() async {
  SharedPref sharedPref = SharedPref();
  final authJson = await sharedPref.readJson("auth");
  Auth? auth = authJson != null ? Auth.fromJson(authJson) : null;

  return auth;
}