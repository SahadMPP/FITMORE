import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:e_commerce/data_base/models/address/db_address_model.dart';
import 'package:e_commerce/screens/user/add_address.dart';
import 'package:e_commerce/screens/user/edit_addres.dart';
import 'package:e_commerce/screens/user/payment/payment_scr.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    addres.getAllAddress();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Shipping Address',
            style: TextStyle(
              color: Color.fromARGB(255, 123, 123, 123),
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: addressListNotifyer,
              builder: (BuildContext context, List<AddressModel> addresslist,
                  Widget? child) {
                if (addresslist.isEmpty) {
                  return const Center(
                    child: SizedBox(
                      height: 350,
                      width: 300,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('asset/addres is empty.png'),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: addresslist.length,
                  itemBuilder: (context, index) {
                    final data = addresslist[index];
                    if (addresslist.isEmpty) {
                      return const Center(
                        child: Text(
                          'Your addres list is Empty',
                          style: TextStyle(
                            color: Color.fromARGB(255, 139, 139, 139),
                            fontSize: 18,
                          ),
                        ),
                      );
                    }
                    return AddressCard(
                      index: index,
                      id: data.id,
                      name: data.name,
                      phoneNumber: data.phonenumber,
                      city: data.city,
                      pincode: data.pincode,
                      state: data.state,
                    );
                  },
                );
              },
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
                    builder: (context) => const AddAdress(),
                  ));
                },
                child: const Text(
                  'Add Address',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class AddressCard extends StatelessWidget {
  int? id;
  int index;
  String? name;
  String? phoneNumber;
  String? city;
  String? pincode;
  String? state;

  AddressCard(
      {super.key,
      required this.index,
      required this.id,
      required this.name,
      required this.phoneNumber,
      required this.city,
      required this.pincode,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PaymentScreen(),
          ));
        },
        child: Container(
          height: 145,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(width: 2, color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: const TextStyle(fontSize: 22, color: Colors.black),
                ),
                const SizedBox(height: 5),
                Text(
                  '$city,$state',
                  style: const TextStyle(fontSize: 17, color: Colors.black),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pincode!,
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      IconButton(
                          onPressed: () {
                            addres.deleteAddress(id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 212, 58, 47),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        phoneNumber!,
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                        width: 60,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => EditAddressScreen(index),
                            ));
                          },
                          child: const Text('Edit'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
