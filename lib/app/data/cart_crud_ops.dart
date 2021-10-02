import 'package:deltasoft/app/data/product_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartOps {
  static void addProduct(ProductModel product) {
    final productBox = Hive.box('products');
    productBox.add(product);
  }
}
