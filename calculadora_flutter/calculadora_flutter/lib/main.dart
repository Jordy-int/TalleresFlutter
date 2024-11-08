import 'package:flutter/material.dart';
import 'config/tema/app_tema.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTema().theme(),
      home: Calculator(),
    );
  }
}

 class Calculator extends StatefulWidget {
  @override
   _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        _output = "0";
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "/" ||
          buttonText== "%" ||
          buttonText == "*") {
        num1 = double.parse(_output);
        operand = buttonText;
        _output = "0";
      } else if (buttonText == ".") {
        if (_output.contains(".")) {
          return;
        } else {
          _output += buttonText;
        }
      } else if (buttonText == "=") {
        num2 = double.parse(_output);
        switch (operand) {
          case "+":
            _output = (num1 + num2).toString();
            break;
          case "-":
            _output = (num1 - num2).toString();
            break;
          case "*":
            _output = (num1 * num2).toString();
            break;
          case "/":
            _output = (num1 / num2).toString();
            break;
          case "%":
          _output = (num1 / 100).toString();
        }
        num1 = 0;
        num2 = 0;
        operand = "";
      } else if (buttonText == "⌫") {
        _output = _output.substring(0, _output.length - 1);
        if (_output == "") {
          _output = "0";
        }
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }

      if (_output.isNotEmpty) {
        output = _output;
      }
    });
  }

  Widget buildButton(String buttonText, {Color? color}) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(buttonText),
        
        style: OutlinedButton.styleFrom(
          backgroundColor: color ?? Colors.white,
          padding: const EdgeInsets.all(24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child:  Text(
              output,
              style:  const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Expanded(child: Divider()),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("AC", color: Colors.black),
                  const SizedBox(width: 8),
                  buildButton("⌫",color: Colors.black),
                  const SizedBox(width: 8),
                  buildButton("/", color: Colors.black),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  buildButton("7"),
                  const SizedBox(width: 8),
                  buildButton("8"),
                  const SizedBox(width: 8),
                  buildButton("9"),
                  const SizedBox(width: 8),
                  buildButton("*", color: Colors.black),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  const SizedBox(width: 8),
                  buildButton("5"),
                  const SizedBox(width: 8),
                  buildButton("6"),
                  const SizedBox(width: 8),
                  buildButton("-", color: Colors.black),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  const SizedBox(width: 8),
                  buildButton("2"),
                  const SizedBox(width: 8),
                  buildButton("3"),
                  const SizedBox(width: 8),
                  buildButton("+", color: Colors.black ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: <Widget>[
                  buildButton("0"),
                  const SizedBox(width: 8),
                  buildButton("."),
                  const SizedBox(width: 8),
                  buildButton("=", color: Colors.black),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}