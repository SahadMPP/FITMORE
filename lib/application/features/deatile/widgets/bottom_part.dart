import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CusBottom extends StatelessWidget {
  final String price;
  final VoidCallback buttonFun;
  const CusBottom({
    super.key, required this.price, required this.buttonFun,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '\$850.00',
              style: GoogleFonts.roboto(
                fontSize: 12.0,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            Text(
              '\$$price.00',
              style: GoogleFonts.roboto(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed:  buttonFun,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: const Color.fromARGB(255, 92, 177, 94),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 12.0),
              ),
              child: Text(
                'Buy',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}