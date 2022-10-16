import 'dart:convert';

import 'package:lanchonete_faculdade/models/Pedidos.dart';
import 'package:http/http.dart' as http;

class AppPedidosRealizadosController {
  String mesa = '1';
  var mesas = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  Stream<List<Pedidos>> getPedidos() async* {
    List<Pedidos> ltResult = [];
    while (true) {
      final response = await http.get(
          Uri.parse('http://192.168.0.109:8080/recuperarHePedido/mesa/$mesa'));
      if (response.statusCode == 200) {
        await Future.delayed(Duration(seconds: 1));
        for (var pedidos in (json.decode(response.body) as List)) {
          if (!ltResult.contains(Pedidos.fromJson(pedidos))) {
            ltResult.add(Pedidos.fromJson(pedidos));
          }
        }

        yield ltResult;
      } else {
        throw Exception('falha ao carregar pedidos');
      }
    }
  }
}
