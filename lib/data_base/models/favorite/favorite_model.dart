import 'package:hive_flutter/adapters.dart';
part 'favorite_model.g.dart';

@HiveType(typeId: 5)
class FavoriteModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int price;
  @HiveField(3)
  String image;

  FavoriteModel({
    this.id,
    required this.title,
    required this.price,
    required this.image,
  });
}
