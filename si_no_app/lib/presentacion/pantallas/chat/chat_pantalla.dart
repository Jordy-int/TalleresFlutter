import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_no_app/dominio/entidades/mensajes.dart';
import 'package:si_no_app/presentacion/providers/chat_providers.dart';
import 'package:si_no_app/presentacion/widgets/chat/mi_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/chat/su_mensaje_burbuja.dart';
import 'package:si_no_app/presentacion/widgets/compartido/caja_de_texto.dart';

class ChatPantalla extends StatelessWidget {
  const ChatPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding( // El leading es un espacio que se tiene antes del título
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSbxmzvX60Xz0zJGdFfc_O1P_djcp2UkJ7GKQBC35uUfh-bYxjb'
            ), // Coloca la url que desees de cualquier imagen en Internet
          ), // Avatar circular
        ), // Padding
        title: const Text('Emilia'),
        centerTitle: false,
      ), // AppBar
      body: _ChatView(),
    ); // Scaffold
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProviders = context.watch()<ChatProviders>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column( // La columna sirve para colocar un widget debajo de otro
          children: [
            Expanded( // Expanded Permite expandir todo el widget hijo a todo el espacio disponible que el padre le de Lista de elementos
              child: ListView.builder(
                itemCount: chatProviders.mensajeLista.length,
                itemBuilder: (context, index) {
                  final mensaje = chatProviders.mensajeLista[index];

                  return (mensaje.deQuien == DeQuien.ella)
                    ? const SuMensajeBurbuja()
                    : MiMensajeBurbuja(mensaje: mensaje);
                }
              ), // ListView.builder // Expanded
            ),
            // Caja de Texto
            CajadeTexto(
              onValue: chatProviders.sendMessage,
            ), // CajaDeTexto
          ],
        ),
      ),
    );
  }
}
