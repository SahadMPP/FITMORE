import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:e_commerce/data_base/models/address/db_address_model.dart';
import 'package:e_commerce/screens/user/edit_addres.dart';
import 'package:e_commerce/screens/user/payment/payment_scr.dart';
import 'package:flutter/material.dart';

class PaymentAddress extends StatelessWidget {
  const PaymentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    addres.getAllAddress();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Shipping Address',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left),
          color: Colors.black,
          iconSize: 35,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: addressListNotifyer,
        builder: (BuildContext context, List<AddressModel> addressList,
            Widget? child) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(thickness: 2),
            itemCount: addressList.length,
            itemBuilder: (context, index) {
              final data = addressList[index];
              return Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 20),
                            child: Text(
                              data.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Container(
                              height: 20,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 229, 229, 229),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: const Center(
                                  child: Text(
                                "HOME",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 100, 100, 100),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 170),
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      EditAddressScreen(index),
                                ));
                              },
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 33, 58, 243),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.city},${data.state},${data.city} - ${data.pincode}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data.phonenumber,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentScreen(),
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.arrow_right_alt,
                                        size: 35,
                                        color: Colors.blue,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                    ]),
              );
            },
          );
        },
      ),
    );
  }
}
