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
      body: corpoPedidos(),
    );
  }

  Widget corpoPedidos() {
    return Column(
      children: [
        clienteMesa(),
        listaPedidos(),
      ],
    );
  }

  Widget clienteMesa() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Row(children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              hintText: 'Cliente',
              labelText: 'Cliente',
            )),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'MESA: ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: _pedidosRealizadosController.mesa,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _pedidosRealizadosController.mesas
                          .map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          _pedidosRealizadosController.mesa = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget listaPedidos() {
    return Expanded(
      child: StreamBuilder<List<Pedidos>>(
        stream: _pedidosRealizadosController.getPedidos(),
        builder: (context, stream) {
          if (stream.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (stream.hasError) {
            return const Text('Error:');
          } else if (stream.hasData) {
            return Text(stream.data.first.nomeCliente);
            // return ListView.builder(
            //     itemCount: _pedidosRealizadosController.ltResult.length,
            //     itemBuilder: (context, index) {
            //       return Text(_pedidosRealizadosController
            //                   .ltResult[index].nomeCliente !=
            //               null
            //           ? _pedidosRealizadosController.ltResult[index].nomeCliente
            //           : "teste");
            //     });
          } else {
            return const Text('Empty data');
          }
        },
      ),
    );
  }
}
