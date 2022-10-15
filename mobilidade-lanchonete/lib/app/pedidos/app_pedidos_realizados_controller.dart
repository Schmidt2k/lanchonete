import 'dart:convert';

import 'package:lanchonete_faculdade/models/Pedidos.dart';
import 'package:http/http.dart' as http;

class AppPedidosRealizadosController {
  Stream<Pedidos> getPedidos() async* {
    while (true) {
      final response = await http
          .get(Uri.parse('http://192.168.0.109:8080/recuperarHePedido'));
      if (response.statusCode == 200) {
        print(response.body);
        yield json
            .decode(response.body)
            .map((i) => Pedidos.fromJson(i))
            .toList();
      } else {
        throw Exception('Failed to load pedidos');
      }
    }

    // dynamic parsedJson = json.decode(response.body);
    // parsedJson = parsedJson.map((job) => Album.fromJson(job)).toList();
  }
}
