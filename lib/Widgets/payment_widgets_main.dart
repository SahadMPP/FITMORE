import 'dart:typed_data';

import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/user_functions/payment_function.dart';
import 'package:e_commerce/screens/user/payment/patment_scr_two.dart';
import 'package:e_commerce/screens/user/payment/payment_scr.dart';
import 'package:flutter/material.dart';

class PaymConAndPrice extends StatelessWidget {
  const PaymConAndPrice({
    super.key,
    required this.newPrice,
    required this.data,
    required this.widget,
    required this.quantity,
  });

  final int? newPrice;
  final ProductModel data;
  final PaymentScreen widget;
  final int quantity;

  @override
  Widget build(BuildContext context) {
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
                backgroundColor: MaterialStatePropertyAll(Colors.orange),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentScreenTwo(
                    productIndex: widget.productIndex,
                    price: newPrice ?? data.price,
                    quantity: quantity,
                    image: data.image1,
                    title: data.title,
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
  }
}

class PaymCalculateCard extends StatelessWidget {
  const PaymCalculateCard({
    super.key,
    required this.widget,
    required this.quantity,
    required this.newPrice,
  });

  final PaymentScreen widget;
  final int quantity;
  final int? newPrice;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
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
    );
  }
}

class PaymProDelCard1 extends StatelessWidget {
  const PaymProDelCard1({
    super.key,
    required this.image64,
    required this.data,
  });

  final Uint8List image64;
  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class PaymShowDisText extends StatelessWidget {
  const PaymShowDisText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
