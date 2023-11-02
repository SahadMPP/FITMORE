import 'package:e_commerce/Widgets/dash_bord_card.dart';
import 'package:e_commerce/Widgets/h1_headline.dart';
import 'package:e_commerce/data_base/function/order_history.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/order_history/order_history_model.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    userr.getAlluser();
    productt.getAllProduct();
    orderhistoryy.getAllOrders();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const H1headline(text: 'Welcome Admin'),
            const SizedBox(height: 20),
            DashbordCard(
              color: Colors.blue,
              listNotifier: userListNotifier,
              value: UserModel,
              name: 'User',
            ),
            DashbordCard(
              color: Colors.orange,
              listNotifier: productListNotifier,
              value: ProductModel,
              name: 'Product',
            ),
            DashbordCard(
              color: Colors.green,
              listNotifier: orderhistoryNotify,
              value: OrderhistoryModel,
              name: 'Orders',
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
                                  '\$${snapshot.data!}',
                                  style: const TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 1,
                                    color: Colors.red,
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
}
