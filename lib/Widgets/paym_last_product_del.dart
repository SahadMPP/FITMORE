import 'package:e_commerce/application/features/payment/getx/payment_get.dart';
import 'package:e_commerce/screens/user/payment/patment_scr_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentLastScrDelCard extends StatelessWidget {
  const PaymentLastScrDelCard({
    super.key,
    required this.widget,
    required this.allow,
  });

  final PaymentScreenTwo widget;
  final bool? allow;

  @override
  Widget build(BuildContext context) {
    final paymentGet  = Get.put(PaymentGet());

    return Column(
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
                          '\$${paymentGet.discoundCalculator(widget.price, allow!)}',
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                    '\$${paymentGet.afterdicount(widget.price, allow!)}',
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
    );
  }
}
