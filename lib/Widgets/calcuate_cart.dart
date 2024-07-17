import 'package:e_commerce/application/features/cart/getX/cart_getx.dart';
import 'package:e_commerce/data_base/function/cart_function.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculateCart extends StatelessWidget {
  const CalculateCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartGet = Get.put(CartGet());
    return ValueListenableBuilder(
      valueListenable: cartvaluelisener,
      builder: (BuildContext context, List<CartModel> cartList, Widget? child) {
        return Visibility(
          // ignore: prefer_is_empty
          visible: cartList.length > 0 ? true : false,
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sub Totel',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FutureBuilder<String>(
                      future:cartGet.getTotelPrice(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!, // Use the null-aware operator here.
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return const Text(
                              'No data'); // Handle the case when there's no data.
                        }
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Coupon discount',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FutureBuilder<String>(
                      future: cartGet.discoundCalculator(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return const Text('No data');
                        }
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Totel',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FutureBuilder<String>(
                      future: cartGet.afterDiscounting(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!, // Use the null-aware operator here.
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return const Text(
                              'No data'); // Handle the case when there's no data.
                        }
                      },
                    )
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        );
      },
    );
  }
}
