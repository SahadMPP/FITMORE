import 'dart:convert';

import 'package:e_commerce/data_base/function/order_history.dart';
import 'package:e_commerce/data_base/models/order_history/order_history_model.dart';
import 'package:e_commerce/screens/user/order_deatiles.dart';
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
        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(thickness: 2),
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            final data = orderList[index];
            final image = data.image;
            final image64 = base64.decode(image);
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OrderDeatiles(index: index),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: SizedBox(
                  height: 90,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: SizedBox(
                                height: 70,
                                width: 70,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: MemoryImage(image64)),
                              ),
                            ),
                            const SizedBox(width: 20),
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
                                        color:
                                            Color.fromARGB(255, 132, 132, 132),
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Finished",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 255, 8),
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
