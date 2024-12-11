import 'dart:convert';

import 'package:flutter_auth/Services/shared_preferences.dart';
import 'package:flutter_auth/shared/models/SalaEspera.dart';
import 'package:http/http.dart' as http;

import '../models/Usuario.dart';

Future<List<SalaEspera>> fetchSalaDeEspera() async {

  Auth? auth = await getAuth();

  List<SalaEspera> list = [];


  dynamic response = await http
      .get(Uri.parse('https://localhost:44362/v1/sala-de-espera/3/2024-01-25'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': '${auth!.type} ${auth.token}'
      });

  if (response.statusCode != 200) {
    throw Exception('Error al cargar la sala de espera');
  }

  Map<String, dynamic> result = json.decode(response.body);

  if (result['status'] != 200) {
    throw Exception('Error al cargar la sala de espera');
  }

  print(result['data']);

  for ( var jdata in result['data']) {
    list.add(SalaEspera(
        id : jdata['id'],
        idCliente : jdata['idCliente'],
        idCita : jdata['idCita'],
        idSede : jdata['idSede'],
        sede : jdata['sede'],
        idEstado : jdata['idEstado'],
        estado : jdata['estado'],
        fecha : jdata['fecha'] != null ? DateTime.parse(jdata['fecha']) : null,
        nombres : jdata['nombres'],
        apellidos : jdata['apellidos']
    ));
  }

  return list;
}


Future<bool> addSalaEspera(int idCita, int idSede) async {

  Auth? auth = await getAuth();

  final msg = jsonEncode({"idCita": idCita, "idSede": idSede});

  dynamic response = await http
      .post(Uri.parse('https://localhost:44362/v1/sala-de-espera'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': '${auth!.type} ${auth.token}'
      },
      body: msg);

  if (response.statusCode != 200) {
    throw Exception('Error, no se pudo registrar en la sala de espera');
  }

  Map<String, dynamic> result = json.decode(response.body);

  if (result['status'] != 201) {
    throw Exception('Error, no se pudo registrar en la sala de espera');
  }

  return true;
}