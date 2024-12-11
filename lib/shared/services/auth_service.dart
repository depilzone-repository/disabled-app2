import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth/shared/models/Usuario.dart';
import 'package:http/http.dart' as http;


Future<Sesion> Login(String $usuario, String $password) async {

  Sesion sesion = Sesion();
  Usuario usuario0 = Usuario();
  Auth auth0 = Auth();

  final msg = jsonEncode({"password":$password, "username": $usuario});

  dynamic response = await http
      .post(Uri.parse('https://localhost:44362/v1/usuario/login'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: msg
  );

  //print(response.message);

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

  usuario0.id = usuario['id'];
  usuario0.nombre = usuario['nombre'];
  usuario0.username =  usuario['username'];
  usuario0.idPerfil =  usuario['idPerfil'];
  usuario0.perfil =  usuario['perfil'];
  usuario0.idSede =  usuario['idSede'];
  usuario0.sede =  usuario['sede'];

  auth0.type =  auth['type'];
  auth0.token =  auth['token'];

  sesion.auth = auth0;
  sesion.usuario = usuario0;

  return sesion;
}