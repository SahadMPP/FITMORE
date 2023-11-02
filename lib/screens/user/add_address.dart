import 'package:e_commerce/Widgets/h1_headline.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/text_field_reg.dart';
import 'package:e_commerce/funtions/add_address_fun.dart';
import 'package:e_commerce/funtions/profile_screen.dart';
import 'package:flutter/material.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({super.key});

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  final _formKey = GlobalKey<FormState>();

  final _nameEditcontroller = TextEditingController();
  final _phonenumberEditcontroller = TextEditingController();
  final _cityEditcontroller = TextEditingController();
  final _pincodeEditcontroller = TextEditingController();
  final _stateEditcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle("Address"),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const H1headline(text: 'Complete Profile'),
            const SizedBox(height: 62),
            TextFieldInReg(
              icon: Icons.person,
              labelText: "Name",
              hintText: 'Enter your name',
              validatorText: 'Enter your name',
              keyboardType: TextInputType.name,
              obscureText: false,
              maxLength: null,
              nameController: _nameEditcontroller,
            ),
            const SizedBox(height: 15),
            TextFieldInReg(
              icon: Icons.phone_android,
              labelText: "Phone Number",
              hintText: 'Enter your phone Number',
              validatorText: 'Enter your phone Number',
              keyboardType: TextInputType.phone,
              obscureText: false,
              maxLength: null,
              nameController: _phonenumberEditcontroller,
            ),
            const SizedBox(height: 15),
            TextFieldInReg(
              icon: Icons.place_outlined,
              labelText: "City",
              hintText: 'Enter your city',
              validatorText: 'Enter your city',
              keyboardType: TextInputType.text,
              obscureText: false,
              maxLength: null,
              nameController: _cityEditcontroller,
            ),
            const SizedBox(height: 15),
            TextFieldInReg(
              icon: Icons.pin_drop,
              labelText: "Pincode",
              hintText: 'Enter your Pincode',
              validatorText: 'Enter your Pincode',
              keyboardType: TextInputType.number,
              obscureText: false,
              maxLength: null,
              nameController: _pincodeEditcontroller,
            ),
            const SizedBox(height: 10),
            TextFieldInReg(
              icon: Icons.map_outlined,
              labelText: "State",
              hintText: 'Enter your State',
              validatorText: 'Enter your State',
              keyboardType: TextInputType.text,
              obscureText: false,
              maxLength: null,
              nameController: _stateEditcontroller,
            ),
            const SizedBox(height: 18),
            Button(
                text: 'Add Address',
                onPressedCallback: () {
                  if (_formKey.currentState!.validate()) {
                    addAddressOnButtonClick(
                        nameEditcontroller: _nameEditcontroller,
                        phonenumberEditcontroller: _phonenumberEditcontroller,
                        cityEditcontroller: _cityEditcontroller,
                        pincodeEditcontroller: _pincodeEditcontroller,
                        stateEditcontroller: _stateEditcontroller,
                        context: context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
