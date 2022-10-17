import 'dart:convert';

import 'package:lanchonete_faculdade/models/lanche.dart';
import 'package:http/http.dart' as http;

class AppCardapioController {
  void teste() {
    try {
      String ingre =
          "Alface, Hamburger, Cheddar, Tomate, Pão de Hamburger, Maionese, Catchup, Cebola"
              .splitMapJoin(',');
      print("teste: $ingre");
    } catch (e) {
      print('AppCardapioController - teste: $e');
    }
  }

  Stream<List<Lanche>> listaLanche() async* {
    while (true) {
      final response = await http
          .get(Uri.parse('http://192.168.0.109:8080/recuperarLanche'));
      if (response.statusCode == 200) {
        await Future.delayed(Duration(seconds: 1));
        yield Lanche.listLanche(json.decode(response.body).toList());
      } else {
        throw Exception('falha ao carregar lanche');
      }
    }
  }
}
