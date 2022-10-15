class Pedidos {
  int idPedido;
  double valorLanche;
  int idMesa;
  String nomeCliente;
  int idLanche;
  String nomeLanche;
  int qtdLanche;
  String obsLanche;

  Pedidos(
      {this.idPedido,
      this.valorLanche,
      this.idMesa,
      this.nomeCliente,
      this.idLanche,
      this.nomeLanche,
      this.qtdLanche,
      this.obsLanche});

  Pedidos.fromJson(Map<String, dynamic> json) {
    idPedido = json['id_pedido'];
    valorLanche = json['valor_lanche'];
    idMesa = json['id_mesa'];
    nomeCliente = json['nome_cliente'];
    idLanche = json['id_lanche'];
    nomeLanche = json['nome_lanche'];
    qtdLanche = json['qtd_lanche'];
    obsLanche = json['obs_lanche'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pedido'] = this.idPedido;
    data['valor_lanche'] = this.valorLanche;
    data['id_mesa'] = this.idMesa;
    data['nome_cliente'] = this.nomeCliente;
    data['id_lanche'] = this.idLanche;
    data['nome_lanche'] = this.nomeLanche;
    data['qtd_lanche'] = this.qtdLanche;
    data['obs_lanche'] = this.obsLanche;
    return data;
  }
}
