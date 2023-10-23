import 'package:e_commerce/data_base/models/coupon/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<CouponModel>> couponNotify = ValueNotifier([]);

Coupon couponn = Coupon();

class Coupon extends ChangeNotifier {
  addCoupon(CouponModel value) async {
    final couponDB = await Hive.openBox<CouponModel>('coupon_db');
    final id = await couponDB.add(value);
    value.id = id;
    final coupon = couponDB.get(id);
    couponDB.put(
      id,
      CouponModel(
        code: coupon!.code,
        id: id,
      ),
    );
    couponNotify.value.add(coupon);
    couponNotify.notifyListeners();
  }

  getAllCoupon() async {
    final couponDB = await Hive.openBox<CouponModel>('coupon_db');
    couponNotify.value.clear();
    couponNotify.value.addAll(couponDB.values);
    couponNotify.notifyListeners();
  }

  deleteCoupon(int id) async {
    final couponDB = await Hive.openBox<CouponModel>('coupon_db');
    couponDB.delete(id);
    getAllCoupon();
  }
}
