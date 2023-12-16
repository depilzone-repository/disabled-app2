import 'package:shared_preferences/shared_preferences.dart';

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