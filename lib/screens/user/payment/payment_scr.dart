import 'package:e_commerce/Widgets/tob_design_order.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .2,
        leading: const Icon(
          Icons.chevron_left,
          size: 30,
          color: Colors.grey,
        ),
        title: const Text(
          'Order Summery',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          const TopBannerOrderPage(),
          const Divider(thickness: 2),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
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
            padding: EdgeInsets.only(right: 160),
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
            thickness: 13,
            color: Color.fromARGB(255, 225, 225, 225),
          ),
        ],
      ),
    );
  }
}
