import 'package:get/get.dart';
import 'package:testedeliverit_app/app/conta_api.dart';
import 'package:testedeliverit_app/models/conta.dart';

class HomeControllerG extends GetxController {
  final contas = List<Conta>().obs;

  final ContaAPI api;
  HomeControllerG(this.api);

  @override
  void onInit() {
    getContas();
    super.onInit();
  }

  getContas() async {
    contas.value = await api.getContas();
  }
}
