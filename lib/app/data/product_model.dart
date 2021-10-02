import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  late final String name;
  @HiveField(1)
  late final String imageUrl;
  @HiveField(2)
  late final String size;
  @HiveField(3)
  late final int quantity;
  @HiveField(4)
  late final String price;
  ProductModel({this.name="",this.imageUrl="",this.price="",this.quantity=1,this.size=""});
}
