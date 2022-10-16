import 'package:flutter/foundation.dart';

class Pedidos {
  int idPedido;
  double valorLanche;
  int idMesa;
  String nomeCliente;
  int idLanche;
  String nomeLanche;
  int qtdLanche;
  String obsLanche;

  Pedidos({
    this.idPedido,
    this.valorLanche,
    this.idMesa,
    this.nomeCliente,
    this.idLanche,
    this.nomeLanche,
    this.qtdLanche,
    this.obsLanche,
  });

  factory Pedidos.fromJson(Map<String, dynamic> json) => Pedidos(
        idPedido: json['idPedido'],
        valorLanche: json['valorLanche'],
        idMesa: json['idMesa'],
        nomeCliente: json['nomeCliente'],
        idLanche: json['idLanche'],
        nomeLanche: json['nomeLanche'],
        qtdLanche: json['qtdLanche'],
        obsLanche: json['obsLanche'],
      );

  static List<Pedidos> listPedidos(List<Map<String, dynamic>> map) {
    List<Pedidos> ltPedidos = [];
    for (var pedidos in map) {
      ltPedidos.add(Pedidos.fromJson(pedidos));
    }
    return ltPedidos;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPedido'] = this.idPedido;
    data['valorLanche'] = this.valorLanche;
    data['idMesa'] = this.idMesa;
    data['nomeCliente'] = this.nomeCliente;
    data['idLanche'] = this.idLanche;
    data['nomeLanche'] = this.nomeLanche;
    data['qtdLanche'] = this.qtdLanche;
    data['obsLanche'] = this.obsLanche;
    return data;
  }
}
