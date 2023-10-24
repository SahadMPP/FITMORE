import 'package:e_commerce/data_base/function/order_history.dart';
import 'package:e_commerce/data_base/models/coupon/coupon_model.dart';
import 'package:e_commerce/data_base/models/order_history/order_history_model.dart';
import 'package:e_commerce/screens/user/payment/payment_last_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class PaymentScreenTwo extends StatefulWidget {
  final int price;
  final int quantity;
  final String image;
  final String title;
  const PaymentScreenTwo(
      {required this.price,
      required this.quantity,
      required this.image,
      required this.title,
      super.key});

  @override
  State<PaymentScreenTwo> createState() => _PaymentScreenTwoState();
}

class _PaymentScreenTwoState extends State<PaymentScreenTwo> {
  final _couponController = TextEditingController();
  String groupValue = 'Yes';
  bool? allow = false;

  checkingCoupon(totelPrice) async {
    final code = _couponController.text;
    final couponDB = await Hive.openBox<CouponModel>('coupon_db');

    for (var i = 0; i < couponDB.length; i++) {
      final currentCode = couponDB.getAt(i);
      if (currentCode!.code == code) {
        allow = true;
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Valid Coupon'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    print(allow);
    discoundCalculator(totelPrice, allow!);
  }

  dynamic discoundCalculator(totelPrice, bool allowV) {
    if (allowV == true) {
      int totel = totelPrice ?? 0;
      dynamic discountedAmount = (5 / 100) * totel;
      print(discountedAmount);
      return discountedAmount;
    }
  }

  afterdicount(totelPrice, bool allowV) {
    if (allowV == true) {
      int totel = totelPrice ?? 0;
      dynamic discountedAmount = (5 / 100) * totel;
      num afterdisc = totel - discountedAmount;
      return afterdisc;
    }
  }

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
            )),
        title: const Text(
          'Payment',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
                child: SizedBox(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromARGB(255, 3, 50, 204)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(35))),
                            child: const Icon(
                              Icons.done,
                              size: 18,
                              color: Color.fromARGB(255, 3, 43, 204),
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '_______________',
                          style: TextStyle(
                              color: Color.fromARGB(255, 33, 82, 243)),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromARGB(255, 3, 50, 204)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(35))),
                            child: const Icon(
                              Icons.done,
                              size: 18,
                              color: Color.fromARGB(255, 3, 43, 204),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '_______________',
                          style: TextStyle(
                              color: Color.fromARGB(255, 33, 82, 243)),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 3, 50, 204),
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(35))),
                              child: const Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                        color: Color.fromARGB(255, 140, 140, 140),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Order Summery",
                    style: TextStyle(
                        color: Color.fromARGB(255, 140, 140, 140),
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Payment",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
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
                                checkingCoupon(widget.price);
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
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PRICE DETAILS',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'price (${widget.quantity} item)',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$${widget.price}.00',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Discount',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        allow == true
                            ? Text(
                                '\$${discoundCalculator(widget.price, allow!)}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : const Text(
                                '\$0.00',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
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
                      allow == true
                          ? Text(
                              '\$${afterdicount(widget.price, allow!)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : Text(
                              '\$${widget.price}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ]),
              ),
              const Divider(thickness: 1),
            ],
          ),
          Container(
            height: 90,
            width: double.infinity,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    child: Image(
                  image: AssetImage('asset/download(Visa).png'),
                  width: 70,
                )),
                SizedBox(
                    child: Image(
                  image: AssetImage('asset/download(MAsterCard).png'),
                  width: 70,
                )),
                SizedBox(
                    child: Image(
                  image: AssetImage('asset/download(Rupa).png'),
                  width: 70,
                )),
                SizedBox(
                    child: Image(
                  image: AssetImage('asset/download(Razopay).png'),
                  width: 70,
                )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                allow == true
                    ? Text(
                        '\$${afterdicount(widget.price, allow!)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Text(
                        '\$${widget.price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    ),
                    onPressed: () {
                      if (groupValue == 'Now3') {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PaymentLastScareen(),
                        ));
                        addToOrderHistory();
                      }
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
          ),
        ],
      ),
    );
  }

  addToOrderHistory() {
    final orderhistory = OrderhistoryModel(
      image: widget.image,
      title: widget.title,
      price: widget.price,
      quantity: widget.quantity,
    );
    orderhistoryy.addOrderHistory(orderhistory);
  }
}
