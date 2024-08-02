import 'dart:convert';

import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/application/features/deatile/ui/product_detiles.dart';
import 'package:flutter/material.dart';

class ProductSecondCard extends StatelessWidget {
  const ProductSecondCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: productListNotifier,
      builder: (BuildContext context, List<ProductModel> productList,
          Widget? child) {
        return SizedBox(
          height: 175,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 15),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final data = productList[index];
                final imageBytes = base64.decode(data.image1);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetiles(
                          discription: data.discription,
                            index: data.id!,
                            title: data.title,
                            price: data.price,
                            image: data.image1),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: .5, color: Colors.grey)),
                      width: 105,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image(
                                fit: BoxFit.fill,
                                image: MemoryImage(imageBytes),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Text(
                                data.title,
                                maxLines: 2,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 17, 17, 17),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: productList.length,
            ),
          ),
        );
      },
    );
  }
}
