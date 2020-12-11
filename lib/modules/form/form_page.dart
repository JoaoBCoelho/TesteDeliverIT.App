import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testedeliverit_app/modules/form/form_controllerg.dart';
import 'package:intl/intl.dart';

class FormPage extends StatelessWidget {
  final FormControllerG controller = Get.find();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Conta",
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.indigo.shade300,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
        ),
        onPressed: () {
          _submitForm();
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                controller.conta.nome = text;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Valor Original"),
              onChanged: (text) {
                controller.conta.valorOriginal = double.parse(text);
              },
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Data Vencimento"),
              onChanged: (text) {
                controller.conta.dataVencimento = formatter.parse(text);
              },
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Data Pagamento"),
              onChanged: (text) {
                controller.conta.dataPagamento = formatter.parse(text);
              },
              keyboardType: TextInputType.datetime,
            ),
          ],
        ),
      ),
    );
  }

  _submitForm() {
    controller.postConta();
    Get.offAndToNamed('home');
  }
}
