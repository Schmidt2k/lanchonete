import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lanchonete_faculdade/app/telas/app_telas.dart';
import 'package:lanchonete_faculdade/app/cardapio/app_cardapio_controller.dart';
import 'package:lanchonete_faculdade/app/cardapio/app_cardapio_view.dart';
import 'package:lanchonete_faculdade/app/lanche/app_lanche_detalhe_controller.dart';
import 'package:lanchonete_faculdade/app/lanche/app_lanche_detalhe_view.dart';
import 'package:lanchonete_faculdade/app/pedidos/app_pedidos_realizados_controller.dart';
import 'package:lanchonete_faculdade/app/pedidos/app_pedidos_realizados_view.dart';
import 'package:lanchonete_faculdade/config/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppCardapioController()),
        Bind((i) => AppLancheDetalheController()),
        Bind((i) => AppPedidosRealizadosController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => AppCardapioView()),
        ModularRouter(TELA_LANCHE_DETALHE,
            child: (_, args) => AppLancheDetalheView()),
        ModularRouter(TELA_PEDIDOS_REALIZADOS,
            child: (_, args) => AppPedidosRealizadosView()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
