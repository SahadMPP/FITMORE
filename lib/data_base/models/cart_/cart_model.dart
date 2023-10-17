import 'package:hive_flutter/adapters.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 4)
class CartModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int price;
  @HiveField(3)
  String image;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  int newPrice;

  CartModel({
    required this.newPrice,
    required this.quantity,
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
}
