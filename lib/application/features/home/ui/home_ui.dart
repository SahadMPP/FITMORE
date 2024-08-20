import 'package:e_commerce/application/features/home/getx/home_get.dart';
import 'package:e_commerce/application/features/home/widgets/category_section.dart';
import 'package:e_commerce/application/features/home/widgets/clearance_bar.dart';
import 'package:e_commerce/application/features/home/widgets/home_gride.dart';
import 'package:e_commerce/application/features/home/widgets/search_bar.dart';
import 'package:e_commerce/application/features/notification/ui/notification_ui.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/screens/user/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> imageList = [
      'asset/images-b5.jpg', 
'asset/images-6.jpg',
'asset/images-b3.jpg',
'asset/images-b4.jpg',
'asset/images-b1.jpg',
    ];
    Product product = Product();
    product.getAllProduct();
    final homeGet = Get.put(HomeGet());
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
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ListOfNotification())),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 33,
                  width: 32,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey[300]!)),
                  child: const Icon(
                    Icons.notification_add,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  right: 5,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.green[500]!,
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
                },
                child: const CusSearchBar()),
            const SizedBox(height: 16),
            CarouselSlider(
                items: imageList.map((image) {
                  return ClearanceBanner(image: image);
                },).toList(),
                options: CarouselOptions(
                  height: 25.sh,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                )),
            const SizedBox(height: 20),
             Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Brand",
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
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                homeGet.brandicons(
                    'asset/download(Nike).png', 'Nike', 0, context),
                homeGet.brandicons(
                    'asset/images(adiddas).png', 'Adidas', 1, context),
                homeGet.brandicons(
                    'asset/images(puma).png', 'Puma', 2, context),
                homeGet.brandicons('asset/download(ds).png', 'Dc', 3, context)
              ],
            ),
            
            const SizedBox(height: 16),
            const CategoriesSection(),
            const SizedBox(height: 16),
            const ProductsGrid(),
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
