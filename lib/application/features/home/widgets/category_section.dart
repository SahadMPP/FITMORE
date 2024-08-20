import 'package:e_commerce/screens/user/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "All",
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ));
              },
              child: Text(
                "See All",
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: const Color.fromARGB(255, 34, 233, 40),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: 38,
        //   child: ListView.builder(
        //     itemCount: list.length,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) {
        //       return  CategoryChip(
        //         label:list[index],
        //         isSelected: index == 0 ? true : false,
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: isSelected == false
            ? Border.all(color: Colors.black54, width: 2)
            : null,
        color: isSelected ? Colors.green : Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}