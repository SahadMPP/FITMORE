import 'package:e_commerce/Widgets/product_card.dart';
import 'package:e_commerce/Widgets/scrolling_image.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:e_commerce/screens/user/category_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Box<FavoriteModel> favoriteBox;
  int currentPage = 0;

  List<Map<String, String>> imageList = [
    {'image': 'asset/images-b1.jpg'},
    {'image': 'asset/images-6.jpg'},
    {'image': 'asset/images-b3.jpg'},
    {'image': 'asset/images-b4.jpg'},
    {'image': 'asset/images-b5.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    productt.getAllProduct();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          toolbarHeight: 65,
          title: Container(
            height: 45,
            width: 140,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'asset/Screenshot 2023-10-17 131021(icon-home).png')),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 8),
              child: SizedBox(
                width: 270,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 255, 255, 255),
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search product',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.all(5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 235, 235, 235),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 10, right: 5, left: 5),
                              child: SizedBox(
                                height: 185,
                                width: double.infinity,
                                child: PageView.builder(
                                  onPageChanged: (value) {
                                    setState(() {
                                      currentPage = value;
                                    });
                                  },
                                  itemCount: imageList.length,
                                  itemBuilder: (context, index) =>
                                      ScrollingImageHome(
                                    image: imageList[index]['image'],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(imageList.length,
                                    (index) => buildDots(index: index))),
                            Padding(
                              padding: const EdgeInsets.only(right: 310),
                              child: Text(
                                'Brand',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                brandicons(
                                    'asset/download(Nike).png', 'Nike', 0),
                                brandicons(
                                    'asset/images(adiddas).png', 'Adidas', 1),
                                brandicons('asset/images(puma).png', 'Puma', 2),
                                brandicons('asset/download(ds).png', 'Dc', 3)
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Populor Product',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          'View All >',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const ProductList(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended Items',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'View All >',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const ProductList(),
            ],
          ),
        ));
  }

  Column brandicons(String image, String name, int index) {
    List<String> categoryName = [
      'Nike',
      'Adiddas',
      'Puma',
      'DS',
    ];
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CategotyList(
                  category: categoryName[index],
                ),
              ),
            );
          },
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.black,
            child: Image(
              width: 56,
              image: AssetImage(image),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  AnimatedContainer buildDots({int? index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 10 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color.fromARGB(255, 232, 138, 16)
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
