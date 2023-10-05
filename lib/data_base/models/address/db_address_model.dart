import 'package:hive_flutter/adapters.dart';
part 'db_address_model.g.dart';

@HiveType(typeId: 3)
class AddressModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String city;
  @HiveField(3)
  final String state;
  @HiveField(4)
  final String pincode;
  @HiveField(5)
  final String phonenumber;

  AddressModel({
    this.id,
    required this.name,
    required this.city,
    required this.state,
    required this.pincode,
    required this.phonenumber,
  });
}
