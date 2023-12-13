import 'dart:convert';

import 'package:flutter_auth/shared/models/Servicio.dart';
import 'package:http/http.dart' as http;

Future<List<Servicio>> fetchServicios() async {

  List<Servicio> list = [];


  dynamic response = await http
      .get(Uri.parse('https://clinic.depilzone.com.pe:6036/api/servicio'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200) {

    Map<String, dynamic> result = json.decode(response.body);

    for ( var jdata in result['data']) {
      list.add(Servicio(
          id: jdata['id'],
          nombre: jdata['nombre'],
          nombreCorto: jdata['nombreCorto'],
          idUsuarioRegistro: jdata['idUsuarioRegistro'],
          idUsuarioModifico: jdata['idUsuarioModifico'],
          fechaRegistro: DateTime.parse(jdata['fechaRegistro']),
          fechaModifico: jdata['fechaModifico'] != null ? DateTime.parse(jdata['fechaModifico']) : null,
          idEstado: jdata['idEstado'],
          color: jdata['color']
      ));
    }

  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');

  }

  return list;
}