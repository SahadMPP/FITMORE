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
