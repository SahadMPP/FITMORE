import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<CartModel>> cartvaluelisener = ValueNotifier([]);

Future<void> addTocart(CartModel value) async {
  final cartDB = await Hive.openBox<CartModel>('cart_db');
  final id = await cartDB.add(value);
  value.id = id;
  print('addind in cart');
  cartvaluelisener.value.clear();
  cartvaluelisener.notifyListeners();
}

Future<void> getAllCart() async {
  final cartDB = await Hive.openBox<CartModel>('cart_db');
  cartvaluelisener.value.clear();
  cartvaluelisener.value.addAll(cartDB.values);
  cartvaluelisener.notifyListeners();
}

Future<void> deleteCartItem(int id) async {
  final cartDB = await Hive.openBox<CartModel>('cart_db');
  cartDB.delete(id);
  getAllCart();
}
