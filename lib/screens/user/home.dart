import 'package:e_commerce/Widgets/product_card.dart';
import 'package:e_commerce/Widgets/product_card_second.dart';
import 'package:e_commerce/Widgets/scrolling_image.dart';
import 'package:e_commerce/Widgets/search_bar_home.dart';
import 'package:e_commerce/Widgets/sponser_banner.dart';
import 'package:e_commerce/application/core/const/const_values.dart';
import 'package:e_commerce/application/features/home/getx/home_get.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:e_commerce/screens/user/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box<FavoriteModel> favoriteBox;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final homeGet = Get.put(HomeGet());
    productt.getAllProduct();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 65,
          title: Container(
            height: 120,
            width: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'asset/photo_2023-10-26_20-08-37-removebg-preview (1).png')),
            ),
          ),
          actions: const [
            SearchBarHome(),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(40, 40),
                      bottomRight: Radius.elliptical(40, 40)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 10, right: 5, left: 5),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        child: SizedBox(
                          height: 185,
                          width: double.infinity,
                          child: PageView.builder(
                            onPageChanged: (value) {
                              setState(() {
                                currentPage = value;
                              });
                            },
                            itemCount: imageListHome.length,
                            itemBuilder: (context, index) => ScrollingImageHome(
                              image: imageListHome[index]['image'],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            imageListHome.length,
                            (index) => homeGet.buildDots(
                                index: index, currentPage: currentPage))),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Brand',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
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
                        homeGet.brandicons(
                            'asset/download(ds).png', 'Dc', 3, context)
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Populor Product',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ));
                    },
                    child: const Text(
                      'View All >',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              const ProductList(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended Items',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: const Text(
                      'View All >',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              const ProductSecondCard(),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sponserd',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 20),
              const SponserBanner(),
            ],
          ),
        ));
  }
}
