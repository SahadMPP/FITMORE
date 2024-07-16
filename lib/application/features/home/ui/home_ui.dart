import 'package:e_commerce/application/features/home/widgets/category_section.dart';
import 'package:e_commerce/application/features/home/widgets/clearance_bar.dart';
import 'package:e_commerce/application/features/home/widgets/home_gride.dart';
import 'package:e_commerce/application/features/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          'Discover',
          style: GoogleFonts.roboto(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 33,
                width: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.grey[300]!)),
                child: const Icon(
                  Icons.shop,
                  size: 18,
                  color: Colors.black,
                ),
              ),
              Positioned(
                right: 5,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.green[500]!,
                  child: const Text(
                    "3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CusSearchBar(),
            SizedBox(height: 16),
            ClearanceBanner(),
            SizedBox(height: 16),
            CategoriesSection(),
            SizedBox(height: 16),
            ProductsGrid(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}








// class BottomNavBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.white,
//       items: [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//         BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//       selectedItemColor: Colors.green,
//       unselectedItemColor: Colors.grey,
//       type: BottomNavigationBarType.fixed,
//     );
//   }
// }
