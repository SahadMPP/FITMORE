import 'dart:convert';
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
          return ListView.builder(
            itemCount: categoryProducts.length,
            itemBuilder: (context, index) {
              final data = categoryProducts[index];
              final base64Image = data.image1;
              final image64 = base64.decode(base64Image);
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 110,
                  child: Row(
                    children: [
                      Container(
                        width: 78,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 245, 245, 245),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 85,
                          width: 60,
                          child: Image(
                              fit: BoxFit.fitWidth,
                              image: MemoryImage(image64)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            data.title,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 21, 21, 21),
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Size 0',
                            style: TextStyle(
                              color: Color.fromARGB(255, 65, 65, 65),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            '\$${data.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.red),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
