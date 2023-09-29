import 'package:e_commerce/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
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
          ListView.builder(
            itemCount: hello.length,
            itemBuilder: (context, index) {
              GlobalKey<FormState> formkey = GlobalKey<FormState>();
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  height: 130,
                  child: Dismissible(
                    key: formkey,
                    onDismissed: (direction) {
                      setState(() {
                        hello.removeAt(index);
                      });
                    },
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
                              child: const Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'asset/balmain-brand-shoe(product1).jpg')),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Text(
                              'Black Balmain Unicorn sneaker Shoe',
                              style: TextStyle(
                                color: Color.fromARGB(255, 65, 65, 65),
                                fontSize: 16,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Size 12',
                              style: TextStyle(
                                color: Color.fromARGB(255, 65, 65, 65),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '\$22.99',
                              style: TextStyle(
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
            },
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
        ],
      ),
    );
  }
}
