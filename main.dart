import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _outputHistory = '';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      _outputHistory = '';
      _num1 = 0.0;
      _num2 = 0.0;
      _operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _outputHistory += '$_output $_operand';
      _output = '0';
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      if (_operand == '+') {
        _output = (_num1 + _num2).toString();
      } else if (_operand == '-') {
        _output = (_num1 - _num2).toString();
      } else if (_operand == '×') {
        _output = (_num1 * _num2).toString();
      } else if (_operand == '÷') {
        _output = (_num1 / _num2).toString();
      }
      _outputHistory += ' $_num2 = $_output';
      _operand = '';
    } else if (buttonText == '√') {
      _num1 = double.parse(_output);
      _output = sqrt(_num1).toString();
      _outputHistory = '√$_num1 = $_output';
    } else if (buttonText == 'x²') {
      _num1 = double.parse(_output);
      _output = pow(_num1, 2).toString();
      _outputHistory = '$_num1² = $_output';
    } else {
      if (_output == '0') {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    setState(() {
      _output;
      _outputHistory;
    });
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () => _buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _outputHistory,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton('7', Colors.grey),
                    buildButton('8', Colors.grey),
                    buildButton('9', Colors.grey),
                    buildButton('÷', Colors.grey),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4', Colors.grey),
                    buildButton('5', Colors.grey),
                    buildButton('6', Colors.grey),
                    buildButton('×', Colors.grey),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1', Colors.grey),
                    buildButton('2', Colors.grey),
                    buildButton('3', Colors.grey),
                    buildButton('-', Colors.grey),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('√', Colors.grey),
                    buildButton('0', Colors.grey),
                    buildButton('C', Colors.grey),
                    buildButton('+', Colors.grey),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('x²', Colors.grey),
                    buildButton('.', Colors.grey),
                    buildButton('=', Colors.blue),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
