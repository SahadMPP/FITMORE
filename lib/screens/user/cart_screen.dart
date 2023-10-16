import 'dart:convert';

import 'package:e_commerce/data_base/function/cart_function.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // @override
  // void initState() {
  //   getTotelPrice();
  //   discoundCalculator();
  //   afterDiscounting();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    cartt.getAllCart();
    // GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 130),
          child: Column(
            children: [
              Text(
                'Your Cart',
                style: TextStyle(
                  color: Color.fromARGB(255, 123, 123, 123),
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "items",
                style: TextStyle(
                  color: Color.fromARGB(255, 123, 123, 123),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: cartvaluelisener,
              builder: (BuildContext context, List<CartModel> cartList,
                  Widget? child) {
                if (cartList.isEmpty) {
                  return const Center(
                    child: Text(
                      'Your cart is Empty',
                      style: TextStyle(
                        color: Color.fromARGB(255, 139, 139, 139),
                        fontSize: 18,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    final data = cartList[index];
                    final base64Image = data.image;
                    final imagebytes = base64.decode(base64Image);
                    GlobalKey<FormState> formkey = GlobalKey<FormState>();
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ValueListenableBuilder(
                        valueListenable:
                            Hive.box<CartModel>('cart_db').listenable(),
                        builder: (context, box, child) {
                          return Dismissible(
                            key: formkey,
                            onDismissed: (direction) {
                              print(index);
                              setState(() {
                                cartList.removeAt(index);
                              });
                              box.delete(index);
                            },
                            direction: DismissDirection.endToStart,
                            background: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 255, 243, 242),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 280),
                                child: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 240, 43, 43),
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 88,
                                  child: AspectRatio(
                                    aspectRatio: 0.88,
                                    child: Container(
                                      width: 88,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: Image(
                                          fit: BoxFit.fill,
                                          image: MemoryImage(imagebytes),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 1),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 15),
                                      Text(
                                        data.title,
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 65, 65, 65),
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Size 1$index',
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 65, 65, 65),
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 60,
                                            child: Text(
                                              '\$${data.newPrice}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 90),
                                            child: Container(
                                              height: 35,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      // countLessing(
                                                      //     quantityy:
                                                      //         data.quantity,
                                                      //     titlee: data.title,
                                                      //     idd: data.id,
                                                      //     imagee: data.image,
                                                      //     pricee: data.price);
                                                    },
                                                    child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.white),
                                                  ),
                                                  Text('${data.quantity}',
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                  InkWell(
                                                    onTap: () async {
                                                      setState(
                                                        () {
                                                          countAdding(
                                                              quantityy:
                                                                  data.quantity,
                                                              pricee:
                                                                  data.price);
                                                        },
                                                      );
                                                      final cart = CartModel(
                                                        dindex: data.dindex,
                                                        id: data.id,
                                                        quantity:
                                                            data.quantity + 1,
                                                        title: data.title,
                                                        price: data.price,
                                                        image: data.image,
                                                        newPrice: data.newPrice,
                                                      );

                                                      await box.putAt(
                                                          index, cart);
                                                    },
                                                    child: const Icon(Icons.add,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder(
            valueListenable: cartvaluelisener,
            builder: (BuildContext context, List<CartModel> cartList,
                Widget? child) {
              return Visibility(
                // ignore: prefer_is_empty
                visible: cartList.length > 0 ? true : false,
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Totel',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // FutureBuilder(
                          //   future: countAdding(),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.connectionState ==
                          //         ConnectionState.waiting) {
                          //       return const Text(
                          //         'Loading...',
                          //         style: TextStyle(
                          //           fontSize: 17,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       );
                          //     } else if (snapshot.hasError) {
                          //       return Text(
                          //         'Error: ${snapshot.error}',
                          //         style: const TextStyle(
                          //           fontSize: 17,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       );
                          //     } else if (snapshot.data != null) {
                          //       return Text(
                          //         snapshot.data!,
                          //         style: const TextStyle(
                          //           fontSize: 17,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       );
                          //     } else {
                          //       // Handle other states or null data if needed
                          //       return const Text(
                          //         'No data available',
                          //         style: TextStyle(
                          //           fontSize: 17,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       );
                          //     }
                          //   },
                          // )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '0.00',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Totel',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '0.00',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: cartvaluelisener,
            builder: (BuildContext context, List<CartModel> cartList,
                Widget? child) {
              return Visibility(
                // ignore: prefer_is_empty
                visible: cartList.length > 0 ? true : false,
                child: Padding(
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
                      onPressed: () {},
                      child: const Text(
                        'Check Out',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  int countAdding({quantityy, pricee}) {
    int quantity = quantityy;
    int price = pricee;
    // String title = titlee;
    // String image = imagee;

    quantity = quantity + 1;
    int newPrice = quantity * price;
    return newPrice;
  }

  // Future<void> countLessing({quantityy, pricee, titlee, imagee, idd}) async {
  //   int id = idd ?? 0;
  //   int quantity = quantityy ?? 0;
  //   int price = pricee ?? 0;
  //   String title = titlee ?? "";
  //   String image = imagee;
  //   if (quantity > 1) {
  //     quantity = quantity - 1;
  //     int newPrice = quantity * price;

  //     final cart = CartModel(
  //       quantity: quantity,
  //       title: title,
  //       price: price,
  //       image: image,
  //     );
  //     await cartt.upgradeCart(id, cart);
  //   }
  // }

  // updateCartLessOnAButtonClick(
  //   int quantityy,
  //   int pricee,
  //   String titlee,
  //   String imagee,
  //   int idd,
  // ) {
  //   int quantity = quantityy;
  //   int price = pricee;
  //   String title = titlee;
  //   String image = imagee;
  //   int id = idd;

  //   if (quantity > 1) {
  //     quantity = quantity - 1;
  //     int newPrice = quantity * price;
  //     final cart = CartModel(
  //       id: id,
  //       title: title,
  //       price: price,
  //       image: image,
  //       quantity: quantity,
  //     );
  //     cartt.upgradeCart(id, cart);
  //     // getTotelPrice();
  //   }

  //   // print('quantity $quantity $price $newPrice ');
  // }
}

// Future<String> getTotelPrice() async {
//   int totelPrice = 0;
//   final cartDB = await Hive.openBox<CartModel>('cart_db');
//   for (var i = 0; i < cartDB.length; i++) {
//     final currentProduct = cartDB.get(i);
//     // if (currentProduct != null) {
//     //   totelPrice = totelPrice + currentProduct.newPrice!;
//     // }
//   }
//   return '\$$totelPrice.00';
// }

// Future<String> discoundCalculator() async {
//   final cartDB = await Hive.openBox<CartModel>('cart_db');
//   num totelPrice = 0;
//   for (var i = 0; i < cartDB.length; i++) {
//     final currentProduct = cartDB.get(i);
//     if (currentProduct != null) {
//       // totelPrice += currentProduct.newPrice!;
//     }
//   }
//   num discountedAmount = (5 / 100) * totelPrice;
//   return '\$$discountedAmount';
// }

// Future<String> afterDiscounting() async {
//   final cartDB = await Hive.openBox<CartModel>('cart_db');
//   num totelPrice = 0;
//   for (var i = 0; i < cartDB.length; i++) {
//     final currentProduct = cartDB.get(i);
//     // if (currentProduct != null) {
//     //   totelPrice += currentProduct.newPrice!;
//     // }
//   }
//   num discountedAmount = (5 / 100) * totelPrice;
//   num afterDisAmount = totelPrice - discountedAmount;
//   return '\$$afterDisAmount';
// }
