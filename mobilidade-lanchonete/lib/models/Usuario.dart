class Usuario {
  final int idUsuario;
  final String nomeUsuario;
  final int senhaUsuario;
  Usuario({this.idUsuario, this.nomeUsuario, this.senhaUsuario});

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      idUsuario: json['idUsuarioMobile'],
      nomeUsuario: json['nomeUsuarioMobile'],
      senhaUsuario: json['senhaUsuarioMobile']);
}
