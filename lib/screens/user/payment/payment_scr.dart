import 'dart:convert';
import 'package:e_commerce/Widgets/paym_addr_card.dart';
import 'package:e_commerce/Widgets/payment_widgets_main.dart';
import 'package:e_commerce/Widgets/tob_design_order.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class PaymentScreen extends StatefulWidget {
  final int productIndex;
  final int index;
  const PaymentScreen(
      {required this.index, required this.productIndex, super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int quantity = 1;
  int? newPrice;
  late ProductModel? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .2,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
            color: Colors.grey,
          ),
        ),
        title: const Text(
          'Order Summery',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: ListView(
        children: [
          const TopBannerOrderPage(),
          const Divider(thickness: 2),
          PaymentAddresCard(widget: widget),
          const SizedBox(height: 15),
          const Divider(
              thickness: 12, color: Color.fromARGB(255, 225, 225, 225)),
          ValueListenableBuilder(
            valueListenable: productListNotifier,
            builder: (BuildContext context, List<ProductModel> productList,
                Widget? child) {
              final data = productList[widget.productIndex];
              final image = data.image1;
              final image64 = base64.decode(image);
              return SizedBox(
                height: 170,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    PaymProDelCard1(image64: image64, data: data),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  height: 35,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (quantity > 1) {
                                            setState(() {
                                              quantity--;
                                            });
                                            newPrice = data.price * quantity;
                                          }
                                        },
                                        child: const Icon(Icons.remove,
                                            color: Colors.black),
                                      ),
                                      Text('$quantity',
                                          style: const TextStyle(
                                              color: Colors.black)),
                                      InkWell(
                                        onTap: () async {
                                          final productDB =
                                              await Hive.openBox<ProductModel>(
                                                  'product_db');

                                          int count = 0;
                                          for (var i = 0;
                                              i < productDB.length;
                                              i++) {
                                            final currentProduct =
                                                productDB.getAt(i);
                                            if (currentProduct!.id == data.id) {
                                              count =
                                                  currentProduct.productCount;
                                            }
                                          }
                                          if (count > quantity) {
                                            setState(() {
                                              quantity++;
                                            });
                                          } else {
                                            // ignore: use_build_context_synchronously
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            // ignore: use_build_context_synchronously
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'product out of stock'),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }

                                          newPrice = data.price * quantity;
                                        },
                                        child: const Icon(Icons.add,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: newPrice == null
                                    ? Text(
                                        '\$ ${data.price}',
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      )
                                    : Text(
                                        '\$ $newPrice',
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                              ),
                              const SizedBox(width: 15),
                              const Text(
                                '5% off',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 22, 114, 25),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const PaymShowDisText()
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 12,
            color: Color.fromARGB(255, 225, 225, 225),
          ),
          const SizedBox(height: 10),
          const Text(
            '  Price Details',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          PaymCalculateCard(
              widget: widget, quantity: quantity, newPrice: newPrice),
          Container(
            width: double.infinity,
            height: 60,
            color: const Color.fromARGB(255, 218, 217, 217),
          ),
          ValueListenableBuilder(
            valueListenable: productListNotifier,
            builder: (BuildContext context, List<ProductModel> productList,
                Widget? child) {
              final data = productList[widget.productIndex];
              return PaymConAndPrice(
                  newPrice: newPrice,
                  data: data,
                  widget: widget,
                  quantity: quantity);
            },
          ),
        ],
      ),
    );
  }
}
