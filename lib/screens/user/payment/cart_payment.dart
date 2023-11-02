import 'package:e_commerce/Widgets/cart_payment_bottom.dart';
import 'package:e_commerce/Widgets/pay_card_productdel.dart';
import 'package:e_commerce/Widgets/payment_secon_top_banner.dart';
import 'package:e_commerce/Widgets/visa_card.dart';
import 'package:e_commerce/user_functions/payment_last_screen_func.dart';
import 'package:flutter/material.dart';

class CartPaymentScreen extends StatefulWidget {
  final dynamic totelPrice;
  final int index;
  const CartPaymentScreen({
    super.key,
    required this.index,
    required this.totelPrice,
  });

  @override
  State<CartPaymentScreen> createState() => _CartPaymentScreenState();
}

class _CartPaymentScreenState extends State<CartPaymentScreen> {
  final _couponController = TextEditingController();
  String groupValue = 'Yes';
  bool? allow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: paymentTitle(context),
      body: ListView(
        children: [
          const TopBannerPaymentSecScr(),
          const SizedBox(height: 10),
          const Divider(thickness: 3),
          ListTile(
            leading: Radio(
                value: 'Yes',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('UPI'),
            subtitle: const Text('Pay by any UPI app'),
            trailing: const Padding(
              padding: EdgeInsets.only(right: 30),
              child: SizedBox(
                  width: 35,
                  child: Image(image: AssetImage('asset/download(UPI).png'))),
            ),
          ),
          ListTile(
            leading: Radio(
                value: 'Now',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('Wallets'),
            trailing: const SizedBox(
                width: 100,
                child: Image(image: AssetImage('asset/images(Phonepay).png'))),
          ),
          ListTile(
            leading: Radio(
                value: 'Now1',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('Credit/Debit/ATM Card'),
            subtitle:
                const Text('Add and secure your card as per RBI quidelines'),
          ),
          ListTile(
            leading: Radio(
                value: 'Now2',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('Net Banking'),
            subtitle: const Text(
                'This instrument has low success,use UPI or cards for better experience'),
          ),
          ListTile(
            leading: Radio(
                value: 'Now3',
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            title: const Text('Cash on Delivery'),
          ),
          const Divider(thickness: 5),
          ListTile(
            leading: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: const Text('Type you code here'),
                      actions: [
                        TextField(
                          controller: _couponController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                checkingCoupon(
                                    totelPrice: widget.totelPrice,
                                    couponController: _couponController,
                                    allow: allow,
                                    context: context);
                              });
                            },
                            child: const Text('Submit')),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close')),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.add)),
            title: const Text('Add Coupon'),
          ),
          const Divider(thickness: 10),
          CartPayDelCard(widget: widget, allow: allow),
          Container(
            height: 90,
            width: double.infinity,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PassingPaymImage(image: 'asset/download(Visa).png'),
                PassingPaymImage(image: 'asset/download(MAsterCard).png'),
                PassingPaymImage(image: 'asset/download(Rupa).png'),
                PassingPaymImage(image: 'asset/download(Razopay).png'),
              ],
            ),
          ),
          CartPaymBottom(allow: allow, widget: widget, groupValue: groupValue),
        ],
      ),
    );
  }
}
