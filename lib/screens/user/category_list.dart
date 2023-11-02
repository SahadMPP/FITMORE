import 'package:e_commerce/Widgets/category_card.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:flutter/material.dart';

class CategotyList extends StatelessWidget {
  final String category;
  const CategotyList({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 120),
          child: Text(
            category,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: productListNotifier,
        builder: (BuildContext context, List<ProductModel> productList,
            Widget? child) {
          final categoryProducts = productList
              .where((product) => product.category == category)
              .toList();
          return CatogeryCard(categoryProducts: categoryProducts);
        },
      ),
    );
  }
}
