import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:e_commerce/data_base/function/cart_function.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/user/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CartGet extends GetxController {
  Future<void> countLessing(
      {quantityy, pricee, titlee, imagee, idd, count}) async {
    int id = idd ?? 0;
    int quantity = quantityy ?? 0;
    int price = pricee ?? 0;
    String title = titlee ?? "";
    String image = imagee;

    if (quantity > 1) {
      quantity = quantity - 1;
      int newPrice = quantity * price;

      final cart = CartModel(
        id: id,
        quantity: quantity,
        title: title,
        price: price,
        image: image,
        newPrice: newPrice,
      );
      await cartt.upgradeCart(id, cart);
    }
  }

  Future<void> countAdding(
      {quantityy, pricee, titlee, imagee, idd, context}) async {
    final productDB = await Hive.openBox<ProductModel>('product_db');

    int count = 0;
    for (var i = 0; i < productDB.length; i++) {
      final currentProduct = productDB.getAt(i);
      if (currentProduct!.id == idd) {
        count = currentProduct.productCount;
      }
    }
    int id = idd ?? 0;
    int quantity = quantityy ?? 0;
    int price = pricee ?? 0;
    String title = titlee ?? "";
    String image = imagee;

    if (count > quantity) {
      quantity = quantity + 1;
      int newPrice = quantity * price;
      final cart = CartModel(
        id: id,
        quantity: quantity,
        title: title,
        price: price,
        image: image,
        newPrice: newPrice,
      );
      await cartt.upgradeCart(id, cart);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('product out of stock'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<String> getTotelPrice() async {
    int totelPrice = 0;

    final cartDB = await Hive.openBox<CartModel>('cart_db');

    for (var i = 0; i < cartDB.length; i++) {
      final currentProduct = cartDB.getAt(i);
      if (currentProduct != null) {
        totelPrice = totelPrice + currentProduct.newPrice;
      }
    }
    totelPriceShare = totelPrice;
    return '\$$totelPrice.00';
  }

  Future<String> discoundCalculator() async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');
    num totelPrice = 0;
    for (var i = 0; i < cartDB.length; i++) {
      final currentProduct = cartDB.getAt(i);
      if (currentProduct != null) {
        totelPrice += currentProduct.newPrice;
      }
    }
    num discountedAmount = (5 / 100) * totelPrice;
    discountedAmount.toInt();
    return '\$${discountedAmount.toInt()}';
  }

  Future<String> afterDiscounting() async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');
    num totelPrice = 0;
    for (var i = 0; i < cartDB.length; i++) {
      final currentProduct = cartDB.getAt(i);
      if (currentProduct != null) {
        totelPrice += currentProduct.newPrice;
      }
    }
    num discountedAmount = (5 / 100) * totelPrice;
    num afterDisAmount = totelPrice - discountedAmount;
    return '\$$afterDisAmount';
  }
}
