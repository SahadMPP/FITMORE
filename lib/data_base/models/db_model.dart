import 'package:hive/hive.dart';
part 'db_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phoneNumber;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String password;

  @HiveField(5)
  final String? profile;

  @HiveField(6)
  final String? adressname;

  @HiveField(7)
  final String? addressphnumber;

  @HiveField(8)
  final String? city;

  @HiveField(9)
  final String? state;

  @HiveField(10)
  final String? pin;

  UserModel(
      {required this.name,
      required this.phoneNumber,
      required this.email,
      required this.password,
      this.city,
      this.state,
      this.pin,
      this.profile,
      this.adressname,
      this.addressphnumber,
      this.id});
}

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
  final String price;
  @HiveField(8)
  final String category;

  ProductModel(
      {required this.title,
      required this.discription,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.image4,
      required this.price,
      required this.category,
      this.id});
}
