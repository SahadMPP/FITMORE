import 'dart:convert';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:flutter/material.dart';

class CatogeryCard extends StatelessWidget {
  const CatogeryCard({
    super.key,
    required this.categoryProducts,
  });

  final List<ProductModel> categoryProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisExtent: 150,
      ),
      itemCount: categoryProducts.length,
      itemBuilder: (context, index) {
        final data = categoryProducts[index];
        final base64Image = data.image1;
        final image64 = base64.decode(base64Image);
        return Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: 90,
                width: 100,
                child: Image(
                  fit: BoxFit.fill,
                  image: MemoryImage(image64),
                ),
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    'Size 1$index',
                    style: const TextStyle(
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
              ),
            )
          ],
        );
      },
    );
  }
}
