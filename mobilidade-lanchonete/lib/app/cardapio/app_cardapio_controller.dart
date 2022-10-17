import 'dart:convert';

import 'package:lanchonete_faculdade/models/Lanche.dart';
import 'package:http/http.dart' as http;

class AppCardapioController {
  Stream<List<Lanche>> listaLanche() async* {
    while (true) {
      final response = await http
          .get(Uri.parse('http://192.168.0.109:8080/recuperarLanche'));
      if (response.statusCode == 200) {
        await Future.delayed(Duration(seconds: 1));
        yield Lanche.listLanche(
            json.decode(utf8.decode(response.bodyBytes)).toList());
      } else {
        throw Exception('falha ao carregar lanche');
      }
    }
  }
}
