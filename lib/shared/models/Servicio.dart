class Servicio {

  final int id;
  final String nombre;
  final String nombreCorto;
  final int idUsuarioRegistro;
  final int? idUsuarioModifico;
  final DateTime fechaRegistro;
  final DateTime? fechaModifico;
  final int idEstado;
  final String color;


  const Servicio({
    required this.id,
    required this.nombre,
    required this.nombreCorto,
    required this.idUsuarioRegistro,
    required this.idUsuarioModifico,
    required this.fechaRegistro,
    required this.fechaModifico,
    required this.idEstado,
    required this.color,
  });

  factory Servicio.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': int id,
      'nombre': String nombre,
      'nombre_corto': String nombreCorto,
      'id_usu_registro': int idUsuarioRegistro,
      'id_usu_modifico': int idUsuarioModifico,
      'f_registro': DateTime fechaRegistro,
      'f_modifico': DateTime? fechaModifico,
      'id_estado': int idEstado,
      'color': String color,
      } =>
          Servicio(
            id: id,
            nombre: nombre,
            nombreCorto: nombreCorto,
            idUsuarioRegistro: idUsuarioRegistro,
            idUsuarioModifico: idUsuarioModifico,
            fechaRegistro: fechaRegistro,
            fechaModifico: fechaModifico,
            idEstado: idEstado,
            color: color,
          ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}