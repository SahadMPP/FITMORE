import 'package:e_commerce/data_base/models/order_history/order_history_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class DashbordCard extends StatelessWidget {
  final Color color;
  final String name;
  final dynamic value;
  final ValueNotifier listNotifier;
  const DashbordCard({
    super.key,
    required this.color,
    required this.listNotifier,
    required this.value,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: listNotifier,
      builder: (BuildContext context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(
                width: 2,
                color: Colors.grey,
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 130,
                  width: 20,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 130,
                  width: 360,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Totel $name',
                        style: const TextStyle(
                          wordSpacing: 2,
                          letterSpacing: 1,
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        '${value.length}',
                        style: TextStyle(
                          wordSpacing: 2,
                          letterSpacing: 1,
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<String> totelRevenue() async {
  final orderDB = await Hive.openBox<OrderhistoryModel>('order_history_db');

  num sum = 0;

  for (var i = 0; i < orderDB.length; i++) {
    final current = orderDB.getAt(i);
    sum = sum + current!.price;
  }
  return '$sum';
}
