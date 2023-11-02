import 'package:e_commerce/data_base/function/order_history.dart';
import 'package:e_commerce/data_base/models/coupon/coupon_model.dart';
import 'package:e_commerce/data_base/models/order_history/order_history_model.dart';
import 'package:e_commerce/screens/user/notification_screen.dart';
import 'package:e_commerce/screens/user/payment/payment_last_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

addToOrderHistory(
    {required productCount,
    required context,
    required imagee,
    required titlee,
    required pricee}) {
  final orderhistory = OrderhistoryModel(
    image: imagee,
    title: titlee,
    price: pricee,
  );

  if (productCount > 0) {
    notificationCount++;
    orderhistoryy.addOrderHistory(orderhistory);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const PaymentLastScareen(),
        ),
        (route) => false);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Out of stock'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

checkingCoupon(
    {required totelPrice,
    required couponController,
    required allow,
    required context}) async {
  final code = couponController.text;
  final couponDB = await Hive.openBox<CouponModel>('coupon_db');

  for (var i = 0; i < couponDB.length; i++) {
    final currentCode = couponDB.getAt(i);
    if (currentCode!.code == code) {
      allow = true;
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Valid Coupon'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Coupon'),
          backgroundColor: Color.fromARGB(255, 255, 61, 61),
        ),
      );
    }
  }
  // ignore: use_build_context_synchronously
  Navigator.of(context).pop();

  discoundCalculator(totelPrice, allow!);
}

dynamic discoundCalculator(totelPrice, bool allowV) {
  if (allowV == true) {
    int totel = totelPrice ?? 0;
    dynamic discountedAmount = (5 / 100) * totel;

    return discountedAmount;
  }
}

afterdicount(totelPrice, bool allowV) {
  if (allowV == true) {
    int totel = totelPrice ?? 0;
    dynamic discountedAmount = (5 / 100) * totel;
    num afterdisc = totel - discountedAmount;
    return afterdisc;
  }
}

AppBar paymentTitle(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: .2,
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.chevron_left,
          size: 30,
          color: Colors.grey,
        )),
    title: const Text(
      'Payment',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
