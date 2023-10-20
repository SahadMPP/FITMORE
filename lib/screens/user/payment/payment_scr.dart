import 'package:e_commerce/Widgets/tob_design_order.dart';
import 'package:e_commerce/screens/user/payment/patment_scr_two.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10, left: 20),
                child: Text(
                  'Sahad Mp',
                  style: TextStyle(
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
                      borderRadius: BorderRadius.all(Radius.circular(5))),
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
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {},
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
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kannur,Kerala,kannur - 676767',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10),
                Text(
                  '737538654',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Divider(
            thickness: 12,
            color: Color.fromARGB(255, 225, 225, 225),
          ),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20),
                      child: SizedBox(
                        height: 100,
                        width: 80,
                        child: Image(
                            image: AssetImage(
                                'asset/balmain-brand-shoe(product1).jpg')),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'U.S. POLO ASSN.',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            'size:6',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 7),
                          Row(
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
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(Icons.remove,
                                        color: Colors.black),
                                  ),
                                  const Text('1',
                                      style: TextStyle(color: Colors.black)),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(Icons.add,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              '\$1,800',
                              style: TextStyle(
                                  color: Colors.black,
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
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                width: double.infinity,
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'price (1 item)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$1800',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '-\$5.00',
                          style: TextStyle(
                            color: Color.fromARGB(255, 42, 117, 44),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
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
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Totel Amount',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$1,800',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
              const Divider(thickness: 1),
              Container(
                padding: const EdgeInsets.all(10),
                height: 40,
                width: double.infinity,
                child: const Text(
                  ' You will save \$5 on this orider',
                  style: TextStyle(
                    color: Color.fromARGB(255, 49, 114, 51),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 60,
            color: const Color.fromARGB(255, 218, 217, 217),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '\$1,800',
                  style: TextStyle(
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
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PaymentScreenTwo(),
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
          ),
        ],
      ),
    );
  }
}
