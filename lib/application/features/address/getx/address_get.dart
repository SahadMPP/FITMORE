import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:e_commerce/data_base/models/address/db_address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddressGet extends GetxController {


  Future<void> addAddressOnButtonClick(
    {required nameEditcontroller,
    required phonenumberEditcontroller,
    required cityEditcontroller,
    required pincodeEditcontroller,
    required stateEditcontroller,
    required context}) async {
  final name = nameEditcontroller.text;
  final phoneNumber = phonenumberEditcontroller.text;
  final city = cityEditcontroller.text;
  final pincode = pincodeEditcontroller.text;
  final state = stateEditcontroller.text;

  if (name.isEmpty ||
      phoneNumber.isEmpty ||
      city.isEmpty ||
      pincode.isEmpty ||
      state.isEmpty) {
    return;
  }

  final addressMo = AddressModel(
    name: name,
    city: city,
    state: state,
    pincode: pincode,
    phonenumber: phoneNumber,
  );

  addres.addAddress(addressMo);

  if (name.isNotEmpty ||
      phoneNumber.isNotEmpty ||
      city.isNotEmpty ||
      pincode.isNotEmpty ||
      state.isNotEmpty) {
    Navigator.pop(context);
  }
}


Future<void> updateAddressOnButtonClick(
    {required nameEditcontroller,
    required phonenumberEditcontroller,
    required cityEditcontroller,
    required pincodeEditcontroller,
    required stateEditcontroller,
    required addresModel}) async {
  final name = nameEditcontroller.text;
  final phoneNumber = phonenumberEditcontroller.text;
  final city = cityEditcontroller.text;
  final pincode = pincodeEditcontroller.text;
  final state = stateEditcontroller.text;

  final address = AddressModel(
    id: addresModel.id,
    name: name,
    city: city,
    state: state,
    pincode: pincode,
    phonenumber: phoneNumber,
  );

  addres.updateAddress(addresModel.id!, address);
}

  
}