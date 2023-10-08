import 'package:hive_flutter/adapters.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 4)
class CartModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String price;
  @HiveField(3)
  String image;

  CartModel({
    this.id,
    required this.title,
    required this.price,
    required this.image,
  });
}
