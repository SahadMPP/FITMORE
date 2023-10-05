import 'dart:convert';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  int? index;
  String? title;
  String? price;
  String? base64Image;
  String? discription;

  ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.base64Image,
      required this.discription,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final imageBytes = base64.decode(base64Image!);
    return SizedBox(
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
                title!,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price!,
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
                  child: IconButton(
                    padding: const EdgeInsets.all(3),
                    onPressed: () {},
                    icon: const Icon(Icons.favorite, color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}