class Lanche {
  final int idLanche;
  final String imagem;
  final String titulo;
  final double valorLanche;
  final String ingredientes;
  Lanche(
      {this.ingredientes,
      this.idLanche,
      this.imagem,
      this.titulo,
      this.valorLanche});

  factory Lanche.fromJson(Map<String, dynamic> json) => Lanche(
        idLanche: json['idLanche'],
        valorLanche: json['valorLanche'],
        imagem: json['imagem'],
        titulo: json['titulo'],
        ingredientes: json['ingredientes'],
      );

  static List<Lanche> listLanche(List list) {
    List<Lanche> ltLanche = [];
    for (var lanche in list) {
      ltLanche.add(Lanche.fromJson(lanche));
    }
    return ltLanche;
  }
}
