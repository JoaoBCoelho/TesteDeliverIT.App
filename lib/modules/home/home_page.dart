import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testedeliverit_app/models/conta.dart';
import 'package:testedeliverit_app/modules/home/home_controllerg.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final HomeControllerG controller = Get.find();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contas",
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.indigo.shade300,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          goToForm();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Obx(() {
              List<Conta> list = controller.contas.value;
              if (list == null || list.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(Duration(milliseconds: 800))
                        .then((value) {
                      return controller.getContas();
                    });
                  },
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return _contaCard(context, list[index]);
                    },
                    itemCount: list.length,
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _contaCard(BuildContext context, Conta conta) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 3.0),
                  child: Text(
                    conta.nome,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 3.0, 12.0, 3.0),
                  child: Text(
                    'R\$ ${conta.valorOriginal.toString()}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 3.0, 12.0, 3.0),
                  child: Text(
                    'R\$ ${conta.valorCorrigido.toString()}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, top: 22.0),
                  child: Text(
                    "Data de pagamento: ${formatter.format(conta.dataPagamento)}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, top: 3.0),
                  child: Text(
                    "Dias de atraso: ${conta.qtdDiasAtraso}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            )
          ],
        ),
        Divider(
          height: 2.0,
          color: Colors.grey,
        )
      ],
    );
  }

  goToForm() {
    Get.offAndToNamed('form');
  }
}
