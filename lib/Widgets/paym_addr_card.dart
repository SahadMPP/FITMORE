import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:e_commerce/data_base/models/address/db_address_model.dart';
import 'package:e_commerce/screens/user/payment/payment_address.dart';
import 'package:e_commerce/screens/user/payment/payment_scr.dart';
import 'package:flutter/material.dart';

class PaymentAddresCard extends StatelessWidget {
  const PaymentAddresCard({
    super.key,
    required this.widget,
  });

  final PaymentScreen widget;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: addressListNotifyer,
      builder:
          (BuildContext context, List<AddressModel> addresList, Widget? child) {
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            PaymentAddress(productIndex: widget.productIndex),
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
    );
  }
}
