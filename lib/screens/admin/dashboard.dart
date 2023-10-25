import 'package:e_commerce/data_base/function/order_history.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/order_history/order_history_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.only(left: 90),
              child: Text(
                'Welcome Admin',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ValueListenableBuilder(
                valueListenable: userListNotifier,
                builder: (BuildContext context, value, child) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 20,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 120,
                          width: 360,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Totel User',
                                style: TextStyle(
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
                                style: const TextStyle(
                                  wordSpacing: 2,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 20,
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 120,
                      width: 360,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Totel Products',
                            style: TextStyle(
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
                          ValueListenableBuilder(
                            valueListenable: productListNotifier,
                            builder: (context, value, child) => Text(
                              '${value.length}',
                              style: const TextStyle(
                                wordSpacing: 2,
                                letterSpacing: 1,
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 20,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 120,
                      width: 360,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Totel Orders',
                            style: TextStyle(
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
                          ValueListenableBuilder(
                            valueListenable: orderhistoryNotify,
                            builder: (BuildContext context,
                                    List<OrderhistoryModel> value,
                                    Widget? child) =>
                                Text(
                              '${value.length}',
                              style: const TextStyle(
                                wordSpacing: 2,
                                letterSpacing: 1,
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 20,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 120,
                      width: 360,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Totel revenue',
                            style: TextStyle(
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
                          FutureBuilder<String>(
                            future: totelRevenue(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!,
                                  style: const TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 1,
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              } else {
                                return const Text('No data');
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> totelRevenue() async {
    final orderDB = await Hive.openBox<OrderhistoryModel>('order_history_db');

    int sum = 0;

    for (var i = 0; i < orderDB.length; i++) {
      final current = orderDB.getAt(i);
      sum = sum + current!.price;
    }
    return '$sum';
  }
}
