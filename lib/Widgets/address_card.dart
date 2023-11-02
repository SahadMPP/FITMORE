import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:e_commerce/screens/user/edit_addres.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  final int? id;
  final int index;
  final String? name;
  final String? phoneNumber;
  final String? city;
  final String? pincode;
  final String? state;

  const AddressCard(
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
                      style: const TextStyle(fontSize: 17, color: Colors.black),
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
                      style: const TextStyle(fontSize: 17, color: Colors.black),
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
    );
  }
}
