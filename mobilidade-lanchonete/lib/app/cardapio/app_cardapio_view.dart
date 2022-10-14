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
        backgroundColor: Colors.black,
        title: Text('Lanchonete FEMA'),
      ),
      body: cardapio(),
    );
  }

  Widget cardapio() {
    return Column(
      children: [
        // clienteMesa(),
        categorias(),
        listaLanches(),
      ],
    );
  }

  Widget categorias() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/lanche.jpg'),
              maxRadius: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Lanches',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
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
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          children: List.generate(1, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'X-TUDO',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/lanche.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
