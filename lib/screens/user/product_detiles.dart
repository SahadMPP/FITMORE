// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:typed_data';

import 'package:e_commerce/data_base/function/product_db_function.dart';
import 'package:e_commerce/data_base/models/db_model.dart';
import 'package:e_commerce/screens/user/address_screen.dart';
import 'package:e_commerce/screens/user/cart_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetiles extends StatefulWidget {
  String title;
  String price;
  String discription;
  int index;
  ProductDetiles(
      {super.key,
      required this.index,
      required this.title,
      required this.price,
      required this.discription});

  @override
  State<ProductDetiles> createState() => _ProductDetilesState();
}

class _ProductDetilesState extends State<ProductDetiles> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    final price = widget.price;
    final description = widget.discription;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
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
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          color: Color(0xFFFF4848),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 233, 232, 232),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Color(0xFFFF4848),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: SizedBox(
                      height: 90,
                      width: 200,
                      child: Text(
                        description,
                        maxLines: 4,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
                },
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddressScreen(),
                  ));
                },
                child: const Text(
                  'Buy now',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
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
        padding: const EdgeInsets.only(left: 10),
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
