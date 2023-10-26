import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<CartModel>> cartvaluelisener = ValueNotifier([]);
Cart cartt = Cart();

//  cart maybe need some edit
class Cart extends ChangeNotifier {
  Future<void> addTocart(CartModel value) async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');
    final id = await cartDB.add(value);
    value.id = id;
    final cart = cartDB.get(id);
    await cartDB.put(
        id,
        CartModel(
          newPrice: cart!.newPrice,
          quantity: cart.quantity,
          id: id,
          title: cart.title,
          price: cart.price,
          image: cart.image,
        ));
    cartvaluelisener.value.add(cart);
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

  Future<void> upgradeCart(int id, CartModel value) async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');

    if (cartDB.containsKey(id)) {
      await cartDB.put(id, value);
      int index =
          cartvaluelisener.value.indexWhere((product) => product.id == id);
      if (index != -1) {
        cartvaluelisener.value[index] = value;
        cartvaluelisener.notifyListeners();
      }
    }
    value.id = id;
    await cartDB.put(id, value);
  }
}
