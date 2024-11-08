import 'package:flutter/material.dart';

class CajadeTexto extends StatelessWidget {
  final ValueChanged<String> onValue;

  const CajadeTexto({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    //final colors = Theme.of(context).colorScheme;

    // Estilo del borde
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    // Decoración del campo de texto
    final inputDecoration = InputDecoration(
      hintText: 'Finaliza su mensaje con un "?"', // Sugerencia de texto
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      onChanged: (value) {
        print('cambiado: $value');
      },
    );
  }
}
