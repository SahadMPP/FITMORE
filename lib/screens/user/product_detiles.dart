import 'dart:convert';
import 'dart:typed_data';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/product_deatiles_card.dart';
import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/cart_/cart_model.dart';
import 'package:e_commerce/data_base/models/product/db_product_model.dart';
import 'package:e_commerce/screens/user/cart_screen.dart';
import 'package:e_commerce/screens/user/payment/payment_address.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// ignore: must_be_immutable
class ProductDetiles extends StatefulWidget {
  int index;
  String title;
  int price;
  String image;

  late Box<CartModel> cartBox;

  ProductDetiles({
    super.key,
    required this.index,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<ProductDetiles> createState() => _ProductDetilesState();
}

class _ProductDetilesState extends State<ProductDetiles> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 241, 241),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "4.8",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.star, color: Color.fromARGB(255, 255, 230, 0)),
                ],
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 90, right: 90),
            child: ValueListenableBuilder(
              valueListenable: productListNotifier,
              builder: (BuildContext context, List<ProductModel> productList,
                  Widget? child) {
                final data = productList[widget.index];
                final base64Image1 = data.image1;
                final base64Image2 = data.image2;
                final base64Image3 = data.image3;
                final base64Image4 = data.image4;
                // ignore: unused_local_variable
                Uint8List imageBytes;
                List<Uint8List> demoImage = [
                  imageBytes = base64.decode(base64Image1),
                  imageBytes = base64.decode(base64Image2),
                  imageBytes = base64.decode(base64Image3),
                  imageBytes = base64.decode(base64Image4),
                ];
                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 202, 200, 200),
                            borderRadius: BorderRadius.circular(5)),
                        child: Image(
                          image: MemoryImage(demoImage[selectedImage]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          ...List.generate(
                            4,
                            (index1) => imageSmallBox(index1, demoImage),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          ProductDetiCard(widget: widget),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ValueListenableBuilder(
              valueListenable: Hive.box<CartModel>('cart_db').listenable(),
              builder: (context, box, child) {
                //  some logical error
                final isInCart = box.get(widget.index) != null;
                return Button(
                  text: isInCart == true ? 'Goto Cart' : 'AddTo Cart',
                  onPressedCallback: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    // addToCart();
                    if (isInCart) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ));
                    } else {
                      final title = widget.title;
                      final price = widget.price;
                      final image = widget.image;

                      final cart = CartModel(
                        id: widget.index,
                        title: title,
                        price: price,
                        image: image,
                        quantity: 1,
                        newPrice: price,
                      );

                      box.put(widget.index, cart);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to Cart'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Button(
              text: "Buy now",
              onPressedCallback: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PaymentAddress(productIndex: widget.index),
                ));
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  GestureDetector imageSmallBox(index, List<Uint8List> demoImage) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Container(
          padding: const EdgeInsets.all(1),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
                  color:
                      selectedImage == index ? Colors.red : Colors.transparent),
              color: const Color.fromARGB(255, 202, 200, 200),
              borderRadius: BorderRadius.circular(5)),
          child: Image(
            fit: BoxFit.fill,
            image: MemoryImage(
              demoImage[index],
            ),
          ),
        ),
      ),
    );
  }
}
