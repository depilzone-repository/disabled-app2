import 'dart:convert';

import '../models/Cita.dart';
import 'package:http/http.dart' as http;

import '../models/Zonas.dart';

Future<Cita> fetchCita(int idCita) async {

  Cita? cita;
  String url = 'https://qa.depilzone.com.pe:9036/api/cita/$idCita';

  dynamic response = await http.get(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

  if (response.statusCode == 200) {

    Map<String, dynamic> result = json.decode(response.body);

    print(result);
    var jdata = result['data'];

    cita = Cita(
      idCita: jdata['id'],
      fecha: DateTime.parse(jdata['fecha']),
      fechaHoraFin: DateTime.parse(jdata['fechaHoraFin']),
      hora: jdata['hora'],
      idServicio: jdata['idServicio'],
      servicio: jdata['servicio'],
      tipoCita: jdata['tipoCita'],
      zonas: [],
      sede: jdata['sede'],
      estado: jdata['estado'],
      colorEstado: jdata['colorEstado'],
    );

    if(jdata['zonas'] != null){
      for ( var zona in jdata['zonas']) {
        print(zona['nombre']);
        cita.zonas!.add(Zona(
            id: zona['id'],
            nombre: zona['nombre'],
            sesion: zona['sesion']
        ));
      }
    }



  }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');

  }

  return cita;
}