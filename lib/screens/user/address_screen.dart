import 'package:e_commerce/Widgets/address_card.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:e_commerce/data_base/models/address/db_address_model.dart';
import 'package:e_commerce/funtions/profile_screen.dart';
import 'package:e_commerce/screens/user/add_address.dart';
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
      appBar: mainTitle('Shipping Address'),
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
          Button(
              text: 'Add Address',
              onPressedCallback: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddAdress(),
                ));
              }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
