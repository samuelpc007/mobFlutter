import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

/* Corpo Principal */
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       primaryColor: Colors.green[700],
       accentColor: Colors.blueAccent[900],
       buttonTheme: ButtonThemeData(
         buttonColor:  Colors.blueAccent[700],
         textTheme: ButtonTextTheme.primary,
       ),
      ),
        home: ListaTransferencias(),
    );
  }
}








