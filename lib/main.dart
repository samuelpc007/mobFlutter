import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

/* Corpo Principal */
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FormularioTransferencia(),
    ));
  }
}

/* Lista Tranferencia */
class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(controlador: _controladorCampoNumeroConta, rotulo: 'Numero da Conta', dica:'0000', icone: Icons.account_balance),
          Editor(controlador: _controladorCampoValor, rotulo: 'Valor', dica:'0.00', icone: Icons.monetization_on),                      
          RaisedButton(
            onPressed: () => _criaTransferencia(),
            child: Text('Confirmar', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
  
}

void _criaTransferencia(){
    final int numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null) {
                final tranferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$tranferenciaCriada');
              }
  }

/* Lista Tranferencia */
class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(children: <Widget>[
        ItemTransferencia(Transferencia(100.0, 1000)),
        ItemTransferencia(Transferencia(200.0, 2000)),
        ItemTransferencia(Transferencia(300.0, 3000)),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia.valor.toString()),
        subtitle: Text(this._transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Tranferencia: {valor: $valor, numeroConta: $numeroConta}';
  }
}

class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 18.0,
        ),
        obscureText: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}