import 'dart:convert';

import 'package:e_commerce/data_base/function/cart_function.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    getAllCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getAllCart();
    GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Column(
            children: [
              Text(
                'Your Cart',
                style: TextStyle(
                  color: Color.fromARGB(255, 123, 123, 123),
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "items",
                style: TextStyle(
                  color: Color.fromARGB(255, 123, 123, 123),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              key: formkey2,
              valueListenable: cartvaluelisener,
              builder: (BuildContext context, List<CartModel> cartList,
                  Widget? child) {
                return ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    final data = cartList[index];
                    return CartCard(
                      title: data.title,
                      price: data.price,
                      image: data.image,
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sub Totel',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$80.00',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount 5%',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$80.00',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Totel',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$80.00',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 255, 145, 0),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Check Out',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final int index;
 const CartCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    final imagebyts = base64.decode(image);
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Dismissible(
        key: _formkey,
        // onDismissed: (direction) {
        //   setState(() {
        //     hello.removeAt(index);
        //   });
        // },
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6E6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 280),
            child: Icon(
              Icons.delete,
              color: Color.fromARGB(255, 248, 55, 41),
            ),
          ),
        ),
        child: SizedBox(
          child: Row(
            children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    width: 88,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                        Image(fit: BoxFit.fill, image: MemoryImage(imagebyts)),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 65, 65, 65),
                      fontSize: 16,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Size 12',
                    style: TextStyle(
                      color: Color.fromARGB(255, 65, 65, 65),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
