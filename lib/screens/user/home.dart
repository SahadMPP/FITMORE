import 'package:e_commerce/Widgets/product_card.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/user/address_screen.dart';
import 'package:e_commerce/screens/user/myorder_screen.dart';
import 'package:e_commerce/screens/user/product_detiles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    getAllProduct();
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
                      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
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
                      backgroundColor: const Color.fromARGB(255, 220, 220, 220),
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image:
                            AssetImage('asset/download (home_background).jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: const Color.fromARGB(255, 134, 0, 212),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'A Summer Surprise',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Cashback 20%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
            ValueListenableBuilder(
              valueListenable: productListNotifier,
              builder: (BuildContext context, List<ProductModel> productList,
                  Widget? child) {
                return SizedBox(
                  height: 230,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final data = productList[index];
                        return GestureDetector(
                          onTap: () {
                            final base64Image = data.image1;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductDetiles(
                                      image: base64Image,
                                      title: data.title,
                                      price: data.price,
                                      discription: data.discription,
                                      index: index,
                                    )));
                          },
                          child: ProductCard(
                              index: index,
                              title: data.title,
                              price: data.price,
                              base64Image: data.image1),
                        );
                      },
                      itemCount: productList.length,
                    ),
                  ),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: productListNotifier,
              builder: (BuildContext context, List<ProductModel> productList,
                  Widget? child) {
                return SizedBox(
                  height: 210,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        dynamic data = productList[index];
                        return ProductCard(
                          title: data.title,
                          price: data.price,
                          base64Image: data.image1,
                          index: index,
                        );
                      },
                      itemCount: productList.length,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
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
}
