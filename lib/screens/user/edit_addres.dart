import 'package:e_commerce/Widgets/h1_headline.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/text_field_reg.dart';
import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:e_commerce/data_base/models/address/db_address_model.dart';
import 'package:e_commerce/user_functions/edit_address_func.dart';
import 'package:flutter/material.dart';

class EditAddressScreen extends StatefulWidget {
  final int index;
  const EditAddressScreen(this.index, {super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late TextEditingController _nameEditcontroller;
  late TextEditingController _phonenumberEditcontroller;
  late TextEditingController _cityEditcontroller;
  late TextEditingController _pincodeEditcontroller;
  late TextEditingController _stateEditcontroller;
  late AddressModel _addresModel;

  @override
  void initState() {
    _nameEditcontroller = TextEditingController();
    _phonenumberEditcontroller = TextEditingController();
    _cityEditcontroller = TextEditingController();
    _pincodeEditcontroller = TextEditingController();
    _stateEditcontroller = TextEditingController();
    final addressList = addressListNotifyer.value;
    _addresModel = addressList[widget.index];
    _nameEditcontroller.text = _addresModel.name;
    _phonenumberEditcontroller.text = _addresModel.phonenumber;
    _cityEditcontroller.text = _addresModel.city;
    _pincodeEditcontroller.text = _addresModel.pincode;
    _stateEditcontroller.text = _addresModel.state;
    super.initState();
  }

  @override
  void dispose() {
    _nameEditcontroller.dispose();
    _phonenumberEditcontroller.dispose();
    _cityEditcontroller.dispose();
    _pincodeEditcontroller.dispose();
    _stateEditcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const H1headline(text: 'Complete Profile'),
            const SizedBox(height: 62),
            TextFieldInReg(
              icon: Icons.person,
              labelText: "Name",
              hintText: 'Enter your name',
              validatorText: "Please enter your name",
              keyboardType: TextInputType.name,
              obscureText: false,
              maxLength: null,
              nameController: _nameEditcontroller,
            ),
            const SizedBox(height: 15),
            TextFieldInReg(
              icon: Icons.phone,
              labelText: "Phone Number",
              hintText: 'Enter your phone number',
              validatorText: 'Enter your phone number',
              keyboardType: TextInputType.phone,
              obscureText: false,
              maxLength: null,
              nameController: _phonenumberEditcontroller,
            ),
            const SizedBox(height: 15),
            TextFieldInReg(
              icon: Icons.place_outlined,
              labelText: "City",
              hintText: 'Enter your City',
              validatorText: 'Enter your City',
              keyboardType: TextInputType.phone,
              obscureText: false,
              maxLength: null,
              nameController: _cityEditcontroller,
            ),
            const SizedBox(height: 15),
            TextFieldInReg(
              icon: Icons.pin_drop_outlined,
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
              keyboardType: TextInputType.streetAddress,
              obscureText: false,
              maxLength: null,
              nameController: _stateEditcontroller,
            ),
            const SizedBox(height: 10),
            Button(
              text: 'Update Address',
              onPressedCallback: () {
                if (formkey.currentState!.validate()) {
                  updateAddressOnButtonClick(
                      nameEditcontroller: _nameEditcontroller,
                      phonenumberEditcontroller: _phonenumberEditcontroller,
                      cityEditcontroller: _cityEditcontroller,
                      pincodeEditcontroller: _pincodeEditcontroller,
                      stateEditcontroller: _stateEditcontroller,
                      addresModel: _addresModel);
                  Navigator.of(context).pop();
                }
              },
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
