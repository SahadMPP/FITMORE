import 'package:e_commerce/data_base/models/db_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<ProductModel>> productListNotifier = ValueNotifier([]);

void addProduct(ProductModel value) async {
  final productDB = await Hive.openBox<ProductModel>('product_db');
  final id = await productDB.add(value);
  value.id = id;
  productListNotifier.value.add(value);
  productListNotifier.notifyListeners();
}

Future<void> getAllProduct() async {
  final productDB = await Hive.openBox<ProductModel>('product_db');
  productListNotifier.value.clear();
  productListNotifier.value.addAll(productDB.values);
  productListNotifier.notifyListeners();
}

Future<void> deleteProduct(id) async {
  final productDB = await Hive.openBox<ProductModel>('product_db');
  productDB.delete(id);
  print('delete Function');
  getAllProduct();
}
