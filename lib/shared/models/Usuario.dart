class Usuario{

   late int? id;
   late String? nombre;
   late  String? apellido;
   late String? correo;
   late String? hash;
   late int? idPerfil;
   late String? perfil;
   late int? idSede;
   late String? sede;

   Usuario({
      this.id,
      this.nombre,
      this.apellido,
      this.correo,
      this.hash,
      this.perfil
  });

  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'apellido': apellido,
    'correo': correo,
    'hash': hash,
    'idPerfil': idPerfil,
    'perfil': perfil,
    'idSede': idSede,
    'sede': sede,
  };

  Usuario.fromJson(Map<String, dynamic> json)
      : nombre = json['nombre'],
        apellido = json['apellido'],
        correo = json['correo'],
        idPerfil = json['idPerfil'],
        perfil = json['perfil'],
        idSede = json['idSede'],
        sede = json['sede'],
        hash = json['hash'];

}