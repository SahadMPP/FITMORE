import 'dart:convert';

import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:flutter/material.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({
    super.key,
    required this.foundproduct,
  });

  final ValueNotifier<List<ProductModel>> foundproduct;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: foundproduct,
      builder: (BuildContext context, List<ProductModel> productList,
          Widget? child) {
        return ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              final data = productList[index];
              final base64Image = data.image1;
              final imageBytes = base64.decode(base64Image);

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
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          height: 85,
                          width: 60,
                          child: Image(
                            fit: BoxFit.fitWidth,
                            // ignore: unnecessary_null_comparison
                            image: data.image1 == null
                                ? const AssetImage(
                                        'asset/download(add image).png')
                                    as ImageProvider<Object>
                                : MemoryImage(imageBytes),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              data.title,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 21, 21, 21),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              maxLines: 2,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Size ${index + 1}0',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 65, 65, 65),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\$${data.price}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
