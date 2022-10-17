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
        valorTotal(),
      ],
    );
  }

  Widget valorTotal() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'TOTAL:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Finalizado',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
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
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: StreamBuilder<List<Pedidos>>(
          stream: _pedidosRealizadosController.getPedidos(),
          initialData: [],
          builder: (context, stream) {
            if (stream.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ));
            }
            if (stream.hasError) {
              return SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Center(
                    child: Text(
                      'Não foi possível carregar os pedidos\n:(',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ));
            } else if (stream.hasData) {
              return ListView.builder(
                  itemCount: stream.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  stream.data[index].nomeLanche,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "R\$ ${stream.data[index].valorLanche.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Text('Empty data');
            }
          },
        ),
      ),
    );
  }
}
