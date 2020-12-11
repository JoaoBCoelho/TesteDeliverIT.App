import 'package:testedeliverit_app/app/conta_api.dart';
import 'package:get/get.dart';
import 'form_controllerg.dart';

class FormBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormControllerG>(() {
      final ContaAPI api = ContaAPI();
      return FormControllerG(api);
    });
  }
}
