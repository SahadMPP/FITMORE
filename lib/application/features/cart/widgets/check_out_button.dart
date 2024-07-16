import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutButton extends StatelessWidget {
  final double total;

  const CheckoutButton({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Proceed to checkout
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: const Color.fromRGBO(41, 187, 45, 1),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            'Checkout for ',
            style: GoogleFonts.roboto(fontSize: 16.0,color: Colors.white),
          ),
          Text(
            '\$$total',
            style:  GoogleFonts.roboto(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ],
      ),
    );
  }
}
