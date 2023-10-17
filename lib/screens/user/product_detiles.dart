import 'dart:convert';
import 'dart:typed_data';

import 'package:e_commerce/data_base/function/cart_function.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';

import 'package:e_commerce/data_base/models/favorite/favorite_model.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/user/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// ignore: must_be_immutable
class ProductDetiles extends StatefulWidget {
  int index;
  String title;
  int price;
  String image;
  late Box<CartModel> cartBox;

  ProductDetiles({
    super.key,
    required this.index,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<ProductDetiles> createState() => _ProductDetilesState();
}

class _ProductDetilesState extends State<ProductDetiles> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "4.8",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.star, color: Color.fromARGB(255, 255, 230, 0)),
                ],
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 90),
            child: ValueListenableBuilder(
              valueListenable: productListNotifier,
              builder: (BuildContext context, List<ProductModel> productList,
                  Widget? child) {
                final data = productList[widget.index];
                final base64Image1 = data.image1;
                final base64Image2 = data.image2;
                final base64Image3 = data.image3;
                final base64Image4 = data.image4;
                // ignore: unused_local_variable
                Uint8List imageBytes;
                List<Uint8List> demoImage = [
                  imageBytes = base64.decode(base64Image1),
                  imageBytes = base64.decode(base64Image2),
                  imageBytes = base64.decode(base64Image3),
                  imageBytes = base64.decode(base64Image4),
                ];
                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 202, 200, 200),
                            borderRadius: BorderRadius.circular(5)),
                        child: Image(
                          image: MemoryImage(demoImage[selectedImage]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          ...List.generate(
                            4,
                            (index1) => imageSmallBox(index1, demoImage),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ValueListenableBuilder(
                valueListenable: productListNotifier,
                builder: (BuildContext context, List<ProductModel> productList,
                    Widget? child) {
                  final data = productList[widget.index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        data.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${data.price}',
                            style: const TextStyle(
                              color: Color(0xFFFF4848),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ValueListenableBuilder(
                              valueListenable:
                                  Hive.box<FavoriteModel>('favorite_db')
                                      .listenable(),
                              builder: (context, box, child) {
                                final isFavorite =
                                    box.get(widget.index) != null;
                                return Container(
                                  width: 70,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 233, 232, 232),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: IconButton(
                                      onPressed: () async {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        if (isFavorite) {
                                          box.delete(widget.index);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content:
                                                Text('Remove from Favorite'),
                                            backgroundColor: Colors.red,
                                          ));
                                        } else {
                                          final base64Image1 = data.image1;
                                          final favorite = FavoriteModel(
                                              id: widget.index,
                                              title: data.title,
                                              price: data.price,
                                              image: base64Image1);
                                          await box.put(widget.index, favorite);
                                        }
                                      },
                                      icon: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: const Color(0xFFFF4848),
                                        size: 30,
                                      )),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: SizedBox(
                          height: 90,
                          width: 200,
                          child: Text(
                            data.discription,
                            maxLines: 4,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ValueListenableBuilder(
                valueListenable: Hive.box<CartModel>('cart_db').listenable(),
                builder: (context, box, child) {
                  //  some logical error
                  final isInCart = box.get(widget.index) != null;
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 145, 0),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      // addToCart();
                      if (isInCart) {
                        // incresss cart item count
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Incresing cart product count'),
                            backgroundColor: Color.fromARGB(255, 99, 98, 98),
                          ),
                        );
                      } else {
                        final title = widget.title;
                        final price = widget.price;
                        final image = widget.image;
                        final cart = CartModel(
                          id: widget.index,
                          title: title,
                          price: price,
                          image: image,
                          quantity: 1,
                          newPrice: price,
                        );

                        box.put(widget.index, cart);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to Cart'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 145, 0),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddressScreen(),
                  ));
                },
                child: const Text(
                  'Buy now',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  GestureDetector imageSmallBox(index, List<Uint8List> demoImage) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Container(
          padding: const EdgeInsets.all(1),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      selectedImage == index ? Colors.red : Colors.transparent),
              color: const Color.fromARGB(255, 202, 200, 200),
              borderRadius: BorderRadius.circular(5)),
          child: Image(
            fit: BoxFit.fill,
            image: MemoryImage(
              demoImage[index],
            ),
          ),
        ),
      ),
    );
  }

  // addCartInButtonClick(titlee, pricee, imagee) {
  //   final title = titlee;
  //   final price = pricee;
  //   final image = imagee;

  //   final cart = CartModel(title: title, price: price, image: image);

  //   cartt.addTocart(cart);
  // }

  // addFavoriteInButtonClick() {
  //   final favorite = FavoriteModel(
  //       title: widget.title, price: widget.price, image: widget.image);
  //   favoritee.addInfavorite(favorite);
  // }

  // Future<void> addToCart(int id,) async {
  //   final cartmodel = CartModel(
  //     id: idd,
  //     quantity: 1,
  //     newPrice: .price,
  //     title: widget.title,
  //     price: widget.price,
  //     image: widget.image,
  //   );
  //   final cartDB = await Hive.openBox<CartModel>('cart_db');
  //   for (var i = 0; i < cartDB.length; i++) {
  //     final currentProduct = cartDB.getAt(i);
  //     if (currentProduct!.id == idd) {
  //       currentProduct.quantity++;
  //       // ignore: use_build_context_synchronously
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Product count added'),
  //           backgroundColor: Colors.grey,
  //         ),
  //       );
  //       break;
  //     }
  //   }

  // if (!cartDB.containsKey(idd)) {
  //   cartt.addTocart(cartmodel);
  //   // ignore: use_build_context_synchronously
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Product added to your cart'),
  //       backgroundColor: Colors.green,
  //     ),
  //   );
  // }
}
