import 'package:deltasoft/app/data/product_model.dart';
import 'package:hive/hive.dart';
class Boxes {
  static Box<ProductModel> getProducts() =>
      Hive.box<ProductModel>('products');
}