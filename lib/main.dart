import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FormularioTransferencia(),
    ));
  }
}

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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 18.0,
              ),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.account_balance),
                  labelText: 'Numero da Conta',
                  hintText: '0000'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 18.0,
              ),
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00'),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            onPressed: () {
              final int numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null) {
               final tranferenciaCriada = Transferencia(valor, numeroConta);
               debugPrint('$tranferenciaCriada');
              }
            },
            child: Text('Confirmar', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

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
  String toString(){
    return 'Tranferencia: {valor: $valor, numeroConta: $numeroConta}';
  }
}
