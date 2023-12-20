import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth/shared/models/Usuario.dart';
import 'package:http/http.dart' as http;

Future<Usuario> Login(String email, String password) async {

  Usuario usuario = const Usuario(hash: 'asdfasdfasd-asdfasdfasd-fasdfasdf', correo: 'asdfasdfasdfasdfads');

  final msg = jsonEncode({"clave":password,"correo":email});

  dynamic response = await http
      .post(Uri.parse('https://clinic.depilzone.com.pe:9136/api/client/login'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: msg
  );

  if (response.statusCode == 200) {

    Map<String, dynamic> result = jsonDecode(response.body);

    if(result['data']['id'] == 0){
      throw Exception('${result['data']['mensaje']}');
    }

    usuario.nombre = '${result['data']['nombres']}';
    usuario.apellido = '${result['data']['apellidos']}';



  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Ocurrio un error al obtener tus datos');
  }

  return usuario;
}