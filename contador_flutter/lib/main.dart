import 'package:flutter/material.dart';

import "package:contador_flutter/presentacion/pantallas/contador_pantallas_funciones.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //StatelessWidget es un widget sin estado, son estáticos en la interfaz. Ej: icono, texto.
  @override
  Widget build(BuildContext context) { //Método build
    return MaterialApp( //Regresa un widget
    //Ctrl Espaciadora banner tap
    debugShowCheckedModeBanner: false, //Quita la marca de la esquina del emulador
    theme: ThemeData( //Tema de la aplicación
      useMaterial3: true,
      colorSchemeSeed: Colors.blue
    ), // ThemeData
    home: const ContadorPantallasFunciones() //Clase a la que llama del archivo contador_pantallas_funciones
    ); // MaterialApp
  }
}
