import 'package:flutter/material.dart';

class RekenmachinePage extends StatefulWidget {
  const RekenmachinePage({Key? key}) : super(key: key);

  @override
  State<RekenmachinePage> createState() => _RekenmachinePageState();
}

class _RekenmachinePageState extends State<RekenmachinePage> {
  String _output = "";
  String _result = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  void _calculate() {
    double result = 0;
    switch (_operand) {
      case '+':
        result = _num1 + _num2;
        break;
      case '-':
        result = _num1 - _num2;
        break;
      case '*':
        result = _num1 * _num2;
        break;
      case '/':
        result = _num1 / _num2;
        break;
    }
    setState(() {
      _result = result.toString();
      _output = _result;
    });
  }

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      setState(() {
        _output = "";
        _result = "";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      });
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      setState(() {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _output = "";
      });
    } else if (buttonText == '=') {
      setState(() {
        _num2 = double.parse(_output);
        _calculate();
      });
    } else {
      setState(() {
        _output += buttonText;
      });
    }
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
        child: SizedBox(
          height: 80.0, // Set the height to twice the original height
          child: TextButton(
            onPressed: () => _buttonPressed(buttonText),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: const BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 35.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Rekenmachine"),
      ),
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('/'),
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('*'),
                ],
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ],
              ),
              Row(
                children: [
                  buildButton('C'),
                  buildButton('0'),
                  buildButton('='),
                  buildButton('+'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
