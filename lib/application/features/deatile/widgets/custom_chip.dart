import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChip extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final String text;
  const CustomChip({
    super.key, required this.icon, required this.text, required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey[300]!)),
      height: 30,
      width: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(
            icon,
            color: iconColor,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
