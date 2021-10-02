import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartController extends GetxController {
  final cartBox = Hive.box("products");
  RxInt totalPrice = 0.obs;
  int cartCounter = 1;
}
