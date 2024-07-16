import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double discount;

  const PriceSummary({super.key, 
    required this.subtotal,
    required this.deliveryFee,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal:',style: GoogleFonts.roboto()),
            Text('\$$subtotal',style: GoogleFonts.roboto(fontWeight: FontWeight.w500),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Fee:',style: GoogleFonts.roboto()),
            Text('\$$deliveryFee',style: GoogleFonts.roboto(fontWeight: FontWeight.w500),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Discount:',style: GoogleFonts.roboto(),),
            Text('$discount%',style: GoogleFonts.roboto(fontWeight: FontWeight.w500),),
          ],
        ),
       
      ],
    );
  }
}