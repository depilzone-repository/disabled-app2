import 'Zonas.dart';

class Cita{
  final int? idCita;
  final DateTime? fecha;
  final DateTime? fechaHoraFin;
  final String? hora;
  final int? idServicio;
  final String? servicio;
  final String? tipoCita;
  final List<Zona>? zonas;
  final String? sede;
  final String? estado;
  final String? colorEstado;


  const Cita({
    this.idCita,
    this.fecha,
    this.fechaHoraFin,
    this.hora,
    this.idServicio,
    this.servicio,
    this.tipoCita,
    this.zonas,
    this.sede,
    this.estado,
    this.colorEstado,
  });

  factory Cita.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'idCita': int idCita,
      'fecha': DateTime fecha,
      'fechaHoraFin': DateTime fechaHoraFin,
      'hora': String hora,
      'idServicio': int idServicio,
      'tipoCita': String tipoCita,
      'servicio': String servicio,
      } =>
          Cita(
            idCita: idCita,
            fecha: fecha,
            fechaHoraFin: fechaHoraFin,
            hora: hora,
            idServicio: idServicio,
            servicio: servicio,
            tipoCita: tipoCita,
            zonas: [],
          ),
      _ => throw const FormatException('Failed to load citas.'),
    };
  }


}