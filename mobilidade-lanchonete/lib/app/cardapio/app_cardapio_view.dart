import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lanchonete_faculdade/app/cardapio/app_cardapio_controller.dart';

class AppCardapioView extends StatefulWidget {
  @override
  State<AppCardapioView> createState() => _AppCardapioViewState();
}

class _AppCardapioViewState extends State<AppCardapioView> {
  final AppCardapioController _cardapioController =
      Modular.get<AppCardapioController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
      ),
      body: cardapio(),
    );
  }

  Widget cardapio() {
    return Column(
      children: [
        clienteMesa(),
        listaLanches(),
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
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: _cardapioController.dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _cardapioController.mesas.map((String items) {
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
                          _cardapioController.dropdownvalue = value;
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

  Widget listaLanches() {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(150)),
            child: Image.asset(
              'assets/lanche.jpg',
            ),
          );
        },
      ),
    );
  }
}
