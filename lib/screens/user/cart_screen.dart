import 'dart:convert';
import 'package:e_commerce/Widgets/calcuate_cart.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/application/core/widgets/appbar.dart';
import 'package:e_commerce/application/features/cart/getX/cart_getx.dart';
import 'package:e_commerce/data_base/function/cart_function.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:e_commerce/screens/user/payment/cart_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';

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
   final cartGet =  Get.put(CartGet());
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
                  return Center(
                      child: Lottie.asset(
                          "asset/Animation - 1717596108476 (2).json",
                          height: 250));
                }
                return ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    final data = cartList[index];
                    final base64Image = data.image;
                    final imagebytes = base64.decode(base64Image);
                    GlobalKey<FormState> formkey = GlobalKey<FormState>();
                    return ValueListenableBuilder(
                      valueListenable:
                          Hive.box<CartModel>('cart_db').listenable(),
                      builder: (context, box, child) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Dismissible(
                            key: formkey,
                            onDismissed: (direction) {
                              setState(() {
                                cartList.removeAt(index);
                              });
                              box.delete(data.id);
                            },
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 255, 243, 242),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 240, 43, 43),
                                ),
                              ),
                            ),
                          
                            child: Container(
                              height: 110,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: double.infinity,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image(
                                          image: MemoryImage(imagebytes),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .6,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              data.title,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Size 1$index',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black45),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 60,
                                                child: Text(
                                                  '\$${data.newPrice}',
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                      cartGet.countLessing(
                                                          idd: data.id,
                                                          imagee:
                                                              data.image,
                                                          pricee:
                                                              data.price,
                                                          quantityy:
                                                              data.quantity,
                                                          titlee:
                                                              data.title,
                                                        );
                                                      },
                                                      child: const Icon(
                                                          Icons.remove,
                                                          color:
                                                              Colors.white),
                                                    ),
                                                    Text('${data.quantity}',
                                                        style:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          cartGet.countAdding(
                                                            idd: data.id,
                                                            imagee:
                                                                data.image,
                                                            pricee:
                                                                data.price,
                                                            quantityy: data
                                                                .quantity,
                                                            titlee:
                                                                data.title,
                                                            context:
                                                                context,
                                                          );
                                                        });
                                                      },
                                                      child: const Icon(
                                                          Icons.add,
                                                          color:
                                                              Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
