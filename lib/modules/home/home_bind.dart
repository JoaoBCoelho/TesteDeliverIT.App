import 'package:testedeliverit_app/app/conta_api.dart';
import 'package:get/get.dart';
import 'home_controllerg.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeControllerG>(() {
      final ContaAPI api = ContaAPI();
      return HomeControllerG(api);
    });
  }
}
