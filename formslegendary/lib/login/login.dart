import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
static const String ruta ="/login";

  @override
  State<StatefulWidget> createState() {
 return _LoginState();
  } 
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejempllo Login"),
      ),
      body: ListView(
        children: [
          Container(child: Form(
            key: formKey,
            child: Column(
              children: [
                obtenerCampoEmail(),
                obtenerCampoPass(),
                obtenerBoton(),
              ],
            ),
          ),)
        ],
      ),
    );

  
}

Widget obtenerCampoEmail() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: "Correo electrónico",
      hintText: "jhon.doe@mail.com",

    ),
    validator: (value){
        String patron = r'^[^@]+@[^@]+\.[^@]+$';
        RegExp regExp = RegExp(patron); 
        if(regExp.hasMatch(value!)){
          return null;
    }else{
      return 'email incorrecto';
    }
    }
  );
}

Widget obtenerCampoPass(){
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: "Contraseña",
      
    ),
    validator: (value){
      if (value!.length > 5){
        return null;
      }else{
        return ("contraseña incorrecta");
      }
    }
  );
}
Widget obtenerBoton(){
  return ElevatedButton(
   
  child: Text("validar"),
  onPressed: (){
    if(formKey.currentState!.validate()){
      formKey.currentState!.reset();
    }
  });
}
}
