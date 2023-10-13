import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<ProductModel>> productListNotifier = ValueNotifier([]);

Product productt = Product();

class Product extends ChangeNotifier {
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
    print('deleting product');
    final productDB = await Hive.openBox<ProductModel>('product_db');
    productDB.delete(id);
    getAllProduct();
  }

  Future<void> updateProduct(int id, ProductModel value) async {
    final productDB = await Hive.openBox<ProductModel>('product_db');
    print('Updating Product');
    if (productDB.containsKey(id)) {
      await productDB.put(id, value);
      int index =
          productListNotifier.value.indexWhere((product) => product.id == id);
      if (index != -1) {
        productListNotifier.value[index] = value;
        productListNotifier.notifyListeners();
      }
    }
    value.id = id;
    await productDB.put(id, value);
  }
}
