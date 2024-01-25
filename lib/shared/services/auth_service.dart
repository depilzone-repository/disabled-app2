import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth/shared/models/Usuario.dart';
import 'package:http/http.dart' as http;

Future<Usuario> Login(String usuario, String password) async {

  Usuario _usuario = Usuario();

  final msg = jsonEncode({"password":password,"usuario":usuario});

  dynamic response = await http
      .post(Uri.parse('https://qa.depilzone.com.pe:5036/api/usuario/login'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: msg
  );

  if (response.statusCode == 200) {

    Map<String, dynamic> result = jsonDecode(response.body);

    print(result);

    if(!result['exito']){
      throw Exception('${result['errorDetalle']}');
    }
    _usuario.id = result['response']['idUsuario'];
    _usuario.nombre = '${result['response']['nombre']}';
    _usuario.apellido = '${result['response']['apellidos']}';
    _usuario.idPerfil = result['response']['idPerfil'];
    _usuario.perfil = '${result['response']['perfil']}';
    _usuario.idSede = result['response']['idSede'];
    _usuario.sede = '${result['response']['sede']}';

  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Ocurrio un error al obtener tus datos');
  }

  return _usuario;
}