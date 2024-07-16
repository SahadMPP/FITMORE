import 'package:e_commerce/application/features/deatile/widgets/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CusMiddle extends StatelessWidget {
  const CusMiddle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .5,
          width: double.infinity,
          color: Colors.yellow[100],
        ),
        const SizedBox(height: 16,),
        const Text(
          'Xbox Series X',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        const Row(
          children: [
            CustomChip(icon: Icons.star, text: '4.5', iconColor: Colors.yellow),
         SizedBox(width: 8.0),
    
            CustomChip(icon: Icons.thumb_up, text: '94%', iconColor: Colors.green),
          ],
        ),
        const SizedBox(height: 16.0),
        Text(
          'The Microsoft Xbox Series X gaming console is capable of impressing with minimal boot times and mesmerizing visual effects when playing games at up to 120 frames per second.',
          style: GoogleFonts.roboto(
              fontSize: 14.0, color: Colors.black, height: 1.5),
        ),
      ],
    );
  }
}