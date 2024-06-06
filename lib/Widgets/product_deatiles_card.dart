import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/user/product_detiles.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ProductDetiCard extends StatelessWidget {
  const ProductDetiCard({
    super.key,
    required this.widget,
  });

  final ProductDetiles widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 224, 224, 224),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ValueListenableBuilder(
          valueListenable: productListNotifier,
          builder: (BuildContext context, List<ProductModel> productList,
              Widget? child) {
            final data = productList[widget.index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${data.price}',
                      style: const TextStyle(
                        color: Color(0xFFFF4848),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ValueListenableBuilder(
                        valueListenable:
                            Hive.box<FavoriteModel>('favorite_db').listenable(),
                        builder: (context, box, child) {
                          final isFavorite = box.get(widget.index) != null;
                          return Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 233, 232, 232),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                onPressed: () async {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  if (isFavorite) {
                                    box.delete(widget.index);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Remove from Favorite'),
                                      backgroundColor: Colors.red,
                                    ));
                                  } else {
                                    final base64Image1 = data.image1;
                                    final favorite = FavoriteModel(
                                        id: widget.index,
                                        title: data.title,
                                        price: data.price,
                                        image: base64Image1);
                                    await box.put(widget.index, favorite);
                                  }
                                },
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: const Color(0xFFFF4848),
                                  size: 30,
                                )),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: SizedBox(
                    height: 90,
                    width: 200,
                    child: Text(
                      data.discription,
                      maxLines: 4,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
