import 'package:hive_flutter/adapters.dart';

part 'coupon_model.g.dart';

@HiveType(typeId: 7)
class CouponModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String code;
  CouponModel({this.id, required this.code});
}
