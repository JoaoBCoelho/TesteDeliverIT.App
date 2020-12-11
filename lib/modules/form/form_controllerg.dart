import 'package:get/get.dart';
import 'package:testedeliverit_app/app/conta_api.dart';
import 'package:testedeliverit_app/models/conta.dart';

class FormControllerG extends GetxController {
  final ContaAPI api;
  final Conta conta = Conta();
  FormControllerG(this.api);

  @override
  void onInit() {
    super.onInit();
  }

  Future<Conta> postConta() async {
    var ret = await api.postConta(conta);
    return ret;
  }
}
