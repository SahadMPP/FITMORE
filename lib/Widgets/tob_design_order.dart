import 'package:flutter/material.dart';

class TopBannerOrderPage extends StatelessWidget {
  const TopBannerOrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
          child: SizedBox(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 3, 50, 204)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35))),
                      child: const Icon(
                        Icons.done,
                        size: 18,
                        color: Color.fromARGB(255, 3, 43, 204),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    '_______________',
                    style: TextStyle(color: Color.fromARGB(255, 33, 82, 243)),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 33, 40, 243),
                            border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 2, 62, 181)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35))),
                        child: const Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    '_______________',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35))),
                        child: const Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Address",
              style: TextStyle(
                  color: Color.fromARGB(255, 140, 140, 140),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5),
            Text(
              "Order Summery",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "Payment",
              style: TextStyle(
                  color: Color.fromARGB(255, 140, 140, 140),
                  fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    );
  }
}
