import 'package:get/get.dart';

import 'package:deltasoft/app/modules/cart/bindings/cart_binding.dart';
import 'package:deltasoft/app/modules/cart/views/cart_view.dart';
import 'package:deltasoft/app/modules/home/bindings/home_binding.dart';
import 'package:deltasoft/app/modules/home/views/home_view.dart';
import 'package:deltasoft/app/modules/product_details/bindings/product_details_binding.dart';
import 'package:deltasoft/app/modules/product_details/views/product_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
  ];
}
