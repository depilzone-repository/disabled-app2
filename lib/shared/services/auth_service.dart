import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth/shared/models/Usuario.dart';
import 'package:http/http.dart' as http;


Future<Sesion> Login(String $usuario, String $password) async {

  Sesion _sesion = Sesion();
  Usuario _usuario = Usuario();
  Auth _auth = Auth();

  final msg = jsonEncode({"password":$password, "username": $usuario});

  dynamic response = await http
      .post(Uri.parse('https://localhost:44362/v1/usuario/login'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: msg
  );

  if (response.statusCode != 200) {
    throw Exception('Ocurrio un error al iniciar sesión');
  }

  Map<String, dynamic> result = jsonDecode(response.body);

  // print(result);

  if(result['status'] != 200){
    throw Exception('${result['error']}');
  }

  Map<String, dynamic> usuario = result['data']['usuario'];
  Map<String, dynamic> auth = result['data']['auth'];

  _usuario.id = usuario['id'];
  _usuario.nombre = usuario['nombre'];
  _usuario.username =  usuario['username'];
  _usuario.idPerfil =  usuario['idPerfil'];
  _usuario.perfil =  usuario['perfil'];
  _usuario.idSede =  usuario['idSede'];
  _usuario.sede =  usuario['sede'];

  _auth.type =  auth['type'];
  _auth.token =  auth['token'];

  _sesion.auth = _auth;
  _sesion.usuario = _usuario;

  return _sesion;
}