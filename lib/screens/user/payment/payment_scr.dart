import 'dart:convert';

import 'package:e_commerce/Widgets/tob_design_order.dart';
import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/address/db_address_model.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/user/payment/patment_scr_two.dart';
import 'package:e_commerce/screens/user/payment/payment_address.dart';
import 'package:flutter/material.dart';

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
  late ProductModel? datag;
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
          ValueListenableBuilder(
            valueListenable: addressListNotifyer,
            builder: (BuildContext context, List<AddressModel> addresList,
                Widget? child) {
              final data = addresList[widget.index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 20),
                        child: Text(
                          data.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(
                          height: 27,
                          width: 55,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 229, 229, 229),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Center(
                              child: Text(
                            "HOME",
                            style: TextStyle(
                                color: Color.fromARGB(255, 100, 100, 100),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 170),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PaymentAddress(
                                  productIndex: widget.productIndex),
                            ));
                          },
                          child: const Text(
                            'Change',
                            style: TextStyle(
                              color: Color.fromARGB(255, 33, 58, 243),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.city},${data.state},${data.city} - ${data.pincode}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data.phonenumber,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 15),
          const Divider(
            thickness: 12,
            color: Color.fromARGB(255, 225, 225, 225),
          ),
          ValueListenableBuilder(
            valueListenable: productListNotifier,
            builder: (BuildContext context, List<ProductModel> productList,
                Widget? child) {
              final data = productList[widget.productIndex];
              datag = data;
              final image = datag!.image1;
              final image64 = base64.decode(image);
              return SizedBox(
                height: 170,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            left: 20,
                          ),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Image(
                              image: MemoryImage(image64),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 7),
                              const Text(
                                'size:6',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 7),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromRGBO(18, 103, 21, 1),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 18, 103, 21),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 18, 103, 21),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 18, 103, 21),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '(11,325)',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 104, 104, 104),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    //--------------------------------------------------------------
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
                                        onTap: () {
                                          setState(() {
                                            quantity++;
                                          });

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
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                text: 'Delivery |  ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '\$5   ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'FREE Delivery',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 39, 102, 41),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ])),
                          )
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
          ValueListenableBuilder(
            valueListenable: productListNotifier,
            builder: (BuildContext context, List<ProductModel> productList,
                Widget? child) {
              final data = productList[widget.productIndex];
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 70,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'price ($quantity item)',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            newPrice == null
                                ? Text(
                                    '\$ ${data.price}.0',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    '\$ $newPrice.0',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Charges',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'FREE Delivery',
                              style: TextStyle(
                                color: Color.fromARGB(255, 42, 117, 44),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 37,
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Totel Amount',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          newPrice == null
                              ? Text(
                                  '\$ ${data.price}.0',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  '\$ $newPrice.0',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                        ]),
                  ),
                  const Divider(thickness: 1),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 40,
                    width: double.infinity,
                    child: Text(
                      ' You will save \$${discoundCalculator(newPrice)} on this orider',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 49, 114, 51),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
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
              return Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    newPrice == null
                        ? Text(
                            '\$ ${data.price}.00',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        : Text(
                            '\$ $newPrice.00',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.orange),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PaymentScreenTwo(
                              price: newPrice ?? data.price,
                              quantity: quantity,
                            ),
                          ));
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  discoundCalculator(totelPrice) {
    int totel = totelPrice ?? 0;
    dynamic discountedAmount = (5 / 100) * totel;
    return discountedAmount;
  }
}
