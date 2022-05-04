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

  void mostrarAlert(){
    AlertDialog dialog = AlertDialog(
      content: Text("¿Esta seguro de que quiere eliminiar esa frase?"),
      actions: [
        TextButton(onPressed:(){
          eliminarValor();
        }, child: Text("SI")),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("NO"))
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return dialog;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo")
      ),
      body: ListView(
        children:[
          Container(
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
                ElevatedButton(
                child: Text("Eliminar Texto"),
                onPressed: valoresIngresados.isNotEmpty ? (){
                    mostrarAlert();
                }
                :null),
              ],
            ),
            Column(
              children: 
                valoresIngresados 
            )
        
          ],
        ),
          )
      
        ],
    ),
    );
  }
}