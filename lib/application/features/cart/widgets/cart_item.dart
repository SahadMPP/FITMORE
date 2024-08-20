import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  final Uint8List imageUrl;
  final String name;
  final double price;
  final int quantity;
  final String subtitle;

  const CartItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.memory(
                  fit: BoxFit.fill,
                  imageUrl,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.roboto(color: Colors.grey,
                            fontSize: 14,
                            ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        '\$$price',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: const Icon(Icons.remove,size: 20,),
                          ),
                          const SizedBox(width: 10,),
                          Text('$quantity'),
                          const SizedBox(width: 10,),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.green),
                            ),
                            child: const Icon(Icons.add,size: 20,color: Colors.green,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        Divider(
          color: Colors.grey[300],
        ),
        const SizedBox(height: 5,),

      ],
    );
  }
}
