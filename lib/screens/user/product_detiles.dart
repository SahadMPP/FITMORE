import 'package:e_commerce/screens/user/address_screen.dart';
import 'package:flutter/material.dart';

List<String> demoImage = [
  'asset/balmain-brand-shoe(product1).jpg',
  'asset/images (p1-2).jpg',
  'asset/images (p1-3).jpg',
  'asset/images (p1-4).jpg',
];

class ProductDetiles extends StatefulWidget {
  const ProductDetiles({super.key});

  @override
  State<ProductDetiles> createState() => _ProductDetilesState();
}

class _ProductDetilesState extends State<ProductDetiles> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
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
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 202, 200, 200),
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  demoImage[selectedImage],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(
                  4,
                  (index) => imageSmallBox(index),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
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
                    'Black Balmain Unicorn sneaker',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$35.99',
                        style: TextStyle(
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
                        'Elevate your game and your hops. Charged with Max Air cushioning in the heel, this lightweight, secure shoe helps you get off the ground confidently and land ',
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
                onPressed: () {},
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

  GestureDetector imageSmallBox(index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
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
        child: Image.asset(
          demoImage[index],
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
