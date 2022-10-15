import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lanchonete_faculdade/app/pedidos/app_pedidos_realizados_controller.dart';
import 'package:lanchonete_faculdade/models/Pedidos.dart';

class AppPedidosRealizadosView extends StatefulWidget {
  @override
  State<AppPedidosRealizadosView> createState() =>
      _AppPedidosRealizadosViewState();
}

class _AppPedidosRealizadosViewState extends State<AppPedidosRealizadosView> {
  final AppPedidosRealizadosController _pedidosRealizadosController =
      Modular.get<AppPedidosRealizadosController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Pedidos Realizados'),
      ),
      body: listaPedidos(),
    );
  }

  Widget listaPedidos() {
    return StreamBuilder<Pedidos>(
      stream: _pedidosRealizadosController.getPedidos(),
      builder: (
        BuildContext context,
        AsyncSnapshot<Pedidos> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return Text(snapshot.data.nomeLanche,
                style: const TextStyle(color: Colors.cyan, fontSize: 36));
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
