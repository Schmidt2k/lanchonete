import 'dart:convert';

import 'package:lanchonete_faculdade/config/url_base.dart';
import 'package:lanchonete_faculdade/models/Lanche.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class AppCardapioController {
  Stream<List<Lanche>> listaLanche() async* {
    while (true) {
      final response = await http.get(Uri.parse(URL_BASE + "recuperarLanche"));
      if (response.statusCode == 200) {
        await Future.delayed(Duration(seconds: 1));
        yield Lanche.listLanche(
            json.decode(utf8.decode(response.bodyBytes)).toList());
      } else {
        throw Exception('falha ao carregar lanche');
      }
    }
  }

  // Stream<List<Lanche>> listaLanche = (() {
  //   StreamController<List<Lanche>> controller;
  //   controller = StreamController<List<Lanche>>(
  //     onListen: () async {
  //       final response =
  //           await http.get(Uri.parse(URL_BASE + "recuperarLanche"));
  //       if (response.statusCode == 200) {
  //         await Future.delayed(Duration(seconds: 1));
  //         controller.add(Lanche.listLanche(
  //             json.decode(utf8.decode(response.bodyBytes)).toList()));
  //       } else {
  //         throw Exception('falha ao carregar lanche');
  //       }
  //       await controller.close();
  //     },
  //   );
  //   return controller.stream;
  // })();
}
