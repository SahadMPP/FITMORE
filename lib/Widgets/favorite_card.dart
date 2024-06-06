import 'dart:typed_data';

import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
      {super.key,
      required this.imagebytes,
      required this.data,
      required this.index});
  final int index;
  final Uint8List imagebytes;
  final FavoriteModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: 88,
                child: Image(
                  fit: BoxFit.fill,
                  image: MemoryImage(imagebytes),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              data.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 65, 65, 65),
                fontSize: 16,
              ),
              maxLines: 2,
            ),
            Text(
              'Size 1$index',
              style: const TextStyle(
                color: Color.fromARGB(255, 65, 65, 65),
                fontSize: 16,
              ),
            ),
            Text(
              '\$${data.price}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}
