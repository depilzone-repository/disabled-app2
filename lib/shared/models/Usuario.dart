class Usuario{

   late final String? nombre;
   late final String? apellido;
   final String? correo;
   final String? hash;

  const Usuario({
    this.nombre,
    this.apellido,
    this.correo,
    this.hash
  });

  Map<String, dynamic> toJson() => {
    'nombre': nombre,
    'apellido': apellido,
    'correo': correo,
    'hash': hash
  };

  Usuario.fromJson(Map<String, dynamic> json)
      : nombre = json['nombre'],
        apellido = json['apellido'],
        correo = json['correo'],
        hash = json['hash'];

}