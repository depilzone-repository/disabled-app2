class Usuario{

   late int? id;
   late String? nombre;
   late  String? apellido;
   late String? correo;
   late int? idPerfil;
   late String? perfil;
   late int? idSede;
   late String? sede;
   late String? username;

   Usuario({
      this.id,
      this.nombre,
      this.apellido,
      this.correo,
      this.perfil,
      this.username
  });

  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'apellido': apellido,
    'correo': correo,
    'idPerfil': idPerfil,
    'perfil': perfil,
    'idSede': idSede,
    'sede': sede,
    'userName': username,
  };

  Usuario.fromJson(Map<String, dynamic> json)
      : nombre = json['nombre'],
        apellido = json['apellido'],
        correo = json['correo'],
        idPerfil = json['idPerfil'],
        perfil = json['perfil'],
        idSede = json['idSede'],
        sede = json['sede'],
        username = json['username'];

}





class Auth{

  late String? type;
  late  String? token;

  Auth({
    this.type,
    this.token,
  });

  Map<String, dynamic> toJson() => {
    'type': type,
    'token': token,
  };

  Auth.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        token = json['token'];

}

class Sesion{
  late Auth? auth;
  late Usuario? usuario;

  Sesion({
    this.auth,
    this.usuario,
  });

  Map<String, dynamic> toJson() => {
    'auth': auth,
    'usuario': usuario,
  };

  Sesion.fromJson(Map<String, dynamic> json)
      : auth = json['auth'],
        usuario = json['usuario'];
}