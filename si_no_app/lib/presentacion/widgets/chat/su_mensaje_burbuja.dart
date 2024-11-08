import 'package:flutter/material.dart';

class SuMensajeBurbuja extends StatelessWidget {
  const SuMensajeBurbuja({super.key});
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; // Toma los colores para las burbujas del tema
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary, // Toma el color definido en el tema
            borderRadius: BorderRadius.circular(20), // Borde redondo en los chats
          ), // BoxDecoration
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Mensaje Respondido', style: TextStyle(color: Colors.white)),
          ), // Padding
        ), // Container
        const SizedBox(height: 5),
        _ImagenBurbuja(),
        const SizedBox(height: 10),
      ], // Column children
    ); // Column
  }
}

class _ImagenBurbuja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Obtiene el tamaño del dispositivo
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Permite hacer bordes redondeados
      child: Image.network(
        "https://servermds.wdf/assets/yes/5-c4c2/88cc48fbc7857a4fb10e3fae373d02c.gif", // URL de la imagen
        width: size.width * 0.7, // Se deja el 70% de ancho para la imagen
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Está enviando una imagen..."), // Mensaje mientras carga
          ); // Container
        },
      ), // Image.network
    ); // ClipRRect
  }
}
