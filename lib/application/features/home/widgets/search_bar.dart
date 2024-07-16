import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CusSearchBar extends StatelessWidget {
  const CusSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.roboto(color: Colors.grey[500], fontSize: 12),
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.only(left: 15),
          filled: true,
          fillColor: const Color.fromARGB(255, 241, 241, 241),
        ),
      ),
    );
  }
}
