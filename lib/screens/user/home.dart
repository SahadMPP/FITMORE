import 'dart:convert';
import 'package:e_commerce/data_base/function/favorite_function.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/user/address_screen.dart';
import 'package:e_commerce/screens/user/myorder_screen.dart';
import 'package:e_commerce/screens/user/product_detiles.dart';
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
    {'image': 'asset/images-b5.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    productt.getAllProduct();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 220, 220, 220),
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search product',
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.all(5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 220, 220, 220),
                        child: IconButton(
                          icon: const Icon(Icons.shopping_cart),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyOrderScreen(),
                            ));
                          },
                          color: const Color.fromARGB(255, 137, 136, 136),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 220, 220, 220),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AddressScreen()));
                          },
                          icon: const Icon(Icons.local_shipping),
                          color: const Color.fromARGB(255, 137, 136, 136),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 10, right: 5, left: 5),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 134, 0, 212),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: PageView.builder(
                            onPageChanged: (value) {
                              setState(() {
                                currentPage = value;
                              });
                            },
                            itemCount: imageList.length,
                            itemBuilder: (context, index) => ScrollingImageHome(
                              image: imageList[index]['image'],
                            ),
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(imageList.length,
                              (index) => buildDots(index: index))),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      'Brand',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      brandicons('asset/download(Nike).png'),
                      brandicons('asset/images(adiddas).png'),
                      brandicons('asset/images(puma).png'),
                      brandicons('asset/download(ds).png')
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
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
              const SizedBox(height: 10),
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

  CircleAvatar brandicons(String image) {
    return CircleAvatar(
      radius: 35,
      backgroundColor: Colors.black,
      child: Image(
        width: 56,
        image: AssetImage(image),
      ),
    );
  }

  addFavoriteInButtonClick(titlee, pricee, imagee) {
    final title = titlee;
    final price = pricee;
    final image = imagee;

    final favorite = FavoriteModel(title: title, price: price, image: image);

    favoritee.addInfavorite(favorite);
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

class ScrollingImageHome extends StatelessWidget {
  final String? image;
  const ScrollingImageHome({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fill,
      image: AssetImage(image!),
      height: 265,
      width: 235,
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: productListNotifier,
      builder: (BuildContext context, List<ProductModel> productList,
          Widget? child) {
        return SizedBox(
          height: 230,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final data = productList[index];
                final imageBytes = base64.decode(data.image1);
                return GestureDetector(
                  onTap: () {
                    final base64Image = data.image1;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ProductDetiles(
                          id: data.id,
                          image: base64Image,
                          title: data.title,
                          price: data.price,
                          discription: data.discription,
                          index: index,
                        );
                      }),
                    );
                  },
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.02,
                          child: Container(
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: MemoryImage(imageBytes),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: SizedBox(
                            height: 30,
                            child: Text(
                              data.title,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${data.price}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 210, 56, 45),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: ValueListenableBuilder(
                                  valueListenable:
                                      Hive.box<FavoriteModel>('favorite_db')
                                          .listenable(),
                                  builder: (context, box, child) {
                                    final isFavorite = box.get(index) != null;
                                    return IconButton(
                                      padding: const EdgeInsets.all(3),
                                      onPressed: () async {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();

                                        if (isFavorite) {
                                          await box.delete(index);

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Remove Successfully'),
                                              backgroundColor: Color.fromARGB(
                                                  255, 255, 62, 62),
                                            ),
                                          );
                                        } else {
                                          final favorite = FavoriteModel(
                                              title: data.title,
                                              price: data.price,
                                              image: data.image1);
                                          await box.put(index, favorite);

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Added Successfully'),
                                              backgroundColor: Color.fromARGB(
                                                  255, 93, 255, 39),
                                            ),
                                          );
                                        }

                                        // print('Button Working');
                                      },
                                      icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: productList.length,
            ),
          ),
        );
      },
    );
  }
}
