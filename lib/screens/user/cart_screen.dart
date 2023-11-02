import 'dart:convert';
import 'package:e_commerce/Widgets/calcuate_cart.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/data_base/function/cart_function.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:e_commerce/funtions/cart_functions.dart';
import 'package:e_commerce/funtions/profile_screen.dart';
import 'package:e_commerce/screens/user/payment/cart_payment.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

int totelPriceShare = 0;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    cartt.getAllCart();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle('My Cart'),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: cartvaluelisener,
              builder: (BuildContext context, List<CartModel> cartList,
                  Widget? child) {
                if (cartList.isEmpty) {
                  return const Center(
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage('asset/download(cartEmpty).png'),
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
                              setState(() {
                                cartList.removeAt(index);
                              });
                              box.delete(data.id);
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
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(13),
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
                                                      countLessing(
                                                        idd: data.id,
                                                        imagee: data.image,
                                                        pricee: data.price,
                                                        quantityy:
                                                            data.quantity,
                                                        titlee: data.title,
                                                      );
                                                    },
                                                    child: const Icon(
                                                        Icons.remove,
                                                        color: Colors.white),
                                                  ),
                                                  Text('${data.quantity}',
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        countAdding(
                                                          idd: data.id,
                                                          imagee: data.image,
                                                          pricee: data.price,
                                                          quantityy:
                                                              data.quantity,
                                                          titlee: data.title,
                                                          context: context,
                                                        );
                                                      });
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
          const CalculateCart(),
          ValueListenableBuilder(
            valueListenable: cartvaluelisener,
            builder: (BuildContext context, List<CartModel> cartList,
                Widget? child) {
              return Visibility(
                // ignore: prefer_is_empty
                visible: cartList.length > 0 ? true : false,
                child: Button(
                    text: 'Check Out',
                    onPressedCallback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CartPaymentScreen(
                          index: 0,
                          totelPrice: totelPriceShare,
                        ),
                      ));
                    }),
              );
            },
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
