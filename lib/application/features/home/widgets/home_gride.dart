import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 16, mainAxisSpacing: 16,childAspectRatio: 3.5/4),
        itemBuilder: (context, index) {
          return  ProductCard(
            imageUrl: '',
            name: 'AirPods',
            price: '\$132.00',
            rating: index.toDouble(),
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final double rating;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Expanded(
            flex: 6,
            child:Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],

              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                Text(name, style: GoogleFonts.aBeeZee(color: Colors.grey[500],fontSize: 12)),
            const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(rating.toString(), style:GoogleFonts.roboto(color: Colors.black45,fontSize: 14,fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
                Text(price, style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          
          
        ],
      ),
    );
  }
}