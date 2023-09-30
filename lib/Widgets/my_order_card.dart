import 'package:flutter/material.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 187, 186, 186),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'asset/balmain-brand-shoe(product1).jpg')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Men's Jet Black italian",
                          style: TextStyle(
                            color: Color.fromARGB(255, 132, 132, 132),
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(height: 45),
                        Text(
                          "\$55.99",
                          style: TextStyle(
                            color: Color.fromARGB(255, 214, 24, 24),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "item",
                    style: TextStyle(
                      color: Color.fromARGB(255, 132, 132, 132),
                      fontSize: 17,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Color.fromARGB(255, 132, 132, 132),
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
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
  }
}
