import 'package:e_commerce/Widgets/payment_addres_card.dart';
import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:flutter/material.dart';

class PaymentAddress extends StatelessWidget {
  final int productIndex;

  const PaymentAddress({required this.productIndex, super.key});

  @override
  Widget build(BuildContext context) {
    addres.getAllAddress();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Shipping Address',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left),
          color: Colors.black,
          iconSize: 35,
        ),
      ),
      body: PaymentAddrescard(productIndex: productIndex),
    );
  }
}
