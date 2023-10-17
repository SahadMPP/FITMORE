import 'dart:convert';

import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/user/product_detiles.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: productListNotifier,
      builder: (BuildContext context, List<ProductModel> productList,
          Widget? child) {
        return SizedBox(
          height: 230,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
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
                            index: index,
                            title: data.title,
                            price: data.price,
                            image: data.image1),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.02,
                          child: Container(
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: MemoryImage(imageBytes),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: SizedBox(
                            height: 30,
                            child: Text(
                              data.title,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${data.price}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 210, 56, 45),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: ValueListenableBuilder(
                                  valueListenable:
                                      Hive.box<FavoriteModel>('favorite_db')
                                          .listenable(),
                                  builder: (context, box, child) {
                                    final isFavorite = box.get(index) != null;
                                    return IconButton(
                                      padding: const EdgeInsets.all(3),
                                      onPressed: () async {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();

                                        if (isFavorite) {
                                          await box.delete(index);

                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Remove Successfully'),
                                              backgroundColor: Color.fromARGB(
                                                  255, 255, 62, 62),
                                            ),
                                          );
                                        } else {
                                          final favorite = FavoriteModel(
                                              id: index,
                                              title: data.title,
                                              price: data.price,
                                              image: data.image1);
                                          await box.put(index, favorite);

                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Added Successfully'),
                                              backgroundColor: Color.fromARGB(
                                                  255, 93, 255, 39),
                                            ),
                                          );
                                        }

                                        // print('Button Working');
                                      },
                                      icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
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
