import 'dart:convert';

import 'package:lanchonete_faculdade/config/url_base.dart';
import 'package:lanchonete_faculdade/models/Pedidos.dart';
import 'package:http/http.dart' as http;
import 'package:lanchonete_faculdade/models/Usuario.dart';

class AppPedidosRealizadosController {
  String mesa = '1';
  var mesas = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  Stream<List<Pedidos>> getPedidos(Usuario usuario) async* {
    while (true) {
      final response = await http.get(
        Uri.parse(URL_BASE +
            'api/pedidos/recuperarHePedido/idCliente/${usuario.idUsuario}'),
      );
      if (response.statusCode == 200) {
        await Future.delayed(Duration(seconds: 1));
        yield Pedidos.listPedidos(
            json.decode(utf8.decode(response.bodyBytes)).toList());
      } else {
        throw Exception('falha ao carregar pedidos');
      }
    }
  }
}
