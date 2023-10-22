import 'dart:convert';

import 'package:e_commerce/data_base/function/order_history.dart';
import 'package:e_commerce/data_base/models/order_history/order_history_model.dart';
import 'package:flutter/material.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: orderhistoryNotify,
      builder: (BuildContext context, List<OrderhistoryModel> orderList,
          Widget? child) {
        return ListView.builder(
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            final data = orderList[index];
            final image = data.image;
            final image64 = base64.decode(image);
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Container(
                height: 171,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(255, 187, 186, 186),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: Image(
                                fit: BoxFit.cover, image: MemoryImage(image64)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    data.title,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 132, 132, 132),
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "\$${data.price}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 214, 24, 24),
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "item",
                            style: TextStyle(
                              color: Color.fromARGB(255, 132, 132, 132),
                              fontSize: 17,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              data.quantity.toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 132, 132, 132),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "status",
                            style: TextStyle(
                              color: Color.fromARGB(255, 132, 132, 132),
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "Finished",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 255, 8),
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
