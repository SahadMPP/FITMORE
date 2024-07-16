import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileDetailRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title: ',
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: GoogleFonts.aBeeZee(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
