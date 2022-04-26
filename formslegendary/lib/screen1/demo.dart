import 'dart:ffi';

import 'package:flutter/material.dart';

class Demo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return  _DemoState();
  }
}

class _DemoState extends State<Demo> {

  TextEditingController controladorInput = TextEditingController();
  List<Widget> valoresIngresados = [];


  void agregarValorIngresado(){
    String textUser = controladorInput.text;
    setState(() {
      var newInput = Text(textUser);
      valoresIngresados.add(newInput);
      controladorInput.text ="";
    });
  }
  void eliminarValor(){
    setState(() {
      valoresIngresados.removeLast();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo")
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: controladorInput,
              decoration: InputDecoration(hintText: "Ingrese un texto",
              helperText: "El texto sera mostrado mas abajo",
              helperStyle: TextStyle(fontSize: 12)
              ),
              
            ),
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  agregarValorIngresado();
                }, 
                child: Text("Agregar Texto"),
                ),
                ElevatedButton(onPressed: (){
                  eliminarValor();
                }, 
                child: Text("Eliminar Texto"),
                )
              ],
            ),
            Column(
              children: 
                valoresIngresados 
              

            )

          ],
        ),
      ),
    );
  }
}