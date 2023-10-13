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
  bool active;

  UserModel(
      {required this.name,
      required this.phoneNumber,
      required this.email,
      required this.password,
      this.profile,
      this.active = true,
      this.id});
}
