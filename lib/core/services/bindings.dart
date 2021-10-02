import 'package:deltasoft/app/modules/cart/controllers/cart_controller.dart';
import 'package:deltasoft/app/modules/home/controllers/home_controller.dart';
import 'package:deltasoft/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProductDetailsController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
