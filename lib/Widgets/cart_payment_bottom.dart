import 'package:e_commerce/data_base/function/cart_function.dart';
import 'package:e_commerce/data_base/function/order_history.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:e_commerce/data_base/models/order_history/order_history_model.dart';
import 'package:e_commerce/funtions/payment_last_screen_func.dart';
import 'package:e_commerce/screens/user/payment/cart_payment.dart';
import 'package:e_commerce/screens/user/payment/payment_last_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CartPaymBottom extends StatelessWidget {
  const CartPaymBottom({
    super.key,
    required this.allow,
    required this.widget,
    required this.groupValue,
  });

  final bool? allow;
  final CartPaymentScreen widget;
  final String groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          allow == true
              ? Text(
                  '\$${afterdicount(widget.totelPrice, allow!)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Text(
                  '\$${widget.totelPrice}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          SizedBox(
            width: 150,
            child: ValueListenableBuilder(
              valueListenable: cartvaluelisener,
              builder: (BuildContext context, List<CartModel> cartList,
                  Widget? child) {
                return ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  ),
                  onPressed: () async {
                    if (groupValue == 'Now3') {
                      final cardDb = await Hive.openBox<CartModel>('cart_db');

                      for (var i = 0; i < cardDb.length; i++) {
                        final data = cartList[i];
                        final order = OrderhistoryModel(
                          image: data.image,
                          title: data.title,
                          price: data.price,
                        );
                        orderhistoryy.addOrderHistory(order);
                      }
                      cardDb.clear();

                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const PaymentLastScareen(),
                          ),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
