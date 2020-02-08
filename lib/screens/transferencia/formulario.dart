import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = "Criando Transferência";
const _textBotaoConfirmar = "Confirmar";

const _rotuloCampoValor = "Valor";
const _dicaCampovalor = "0.00";

const _rotuloCampoNumeroConta = "Numero da Conta";
const _dicaCampoNumeroConta = "0000";



class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                icone: Icons.account_balance),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampovalor,
                icone: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textBotaoConfirmar, style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final tranferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, tranferenciaCriada);
    }
  }
}
