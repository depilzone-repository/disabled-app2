class SalaEspera{
  int? id;
  int? idCliente;
  int? idCita;
  int? idSede;
  String? sede;
  int? idEstado;
  String? estado;
  DateTime? fecha;
  String? nombres;
  String? apellidos;


  SalaEspera({
    this.id,
    this.idCliente,
    this.idCita,
    this.idSede,
    this.sede,
    this.idEstado,
    this.estado,
    this.fecha,
    this.nombres,
    this.apellidos,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'idCliente': idCliente,
    'idCita': idCita,
    'idSede': idSede,
    'sede': sede,
    'idEstado': idEstado,
    'estado': estado,
    'fecha': fecha,
    'nombres': nombres,
    'apellidos': apellidos,
  };

  SalaEspera.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idCliente = json['idCliente'],
        idCita = json['idCita'],
        idSede = json['idSede'],
        sede = json['sede'],
        idEstado = json['idEstado'],
        estado = json['estado'],
        fecha = json['fecha'],
        nombres = json['nombres'],
        apellidos = json['apellidos'];
}