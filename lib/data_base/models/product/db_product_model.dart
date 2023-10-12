import 'package:hive_flutter/adapters.dart';
part 'db_product_model.g.dart';

@HiveType(typeId: 2)
class ProductModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String discription;
  @HiveField(3)
  final String image1;
  @HiveField(4)
  final String image2;
  @HiveField(5)
  final String image3;
  @HiveField(6)
  final String image4;
  @HiveField(7)
  final int price;
  @HiveField(8)
  final String category;
  @HiveField(9)
  bool? active;

  ProductModel({
    required this.title,
    required this.discription,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.price,
    required this.category,
    this.id,
    this.active = true,
  });
}
