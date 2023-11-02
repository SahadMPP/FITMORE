import 'package:e_commerce/data_base/function/address_function.dart';
import 'package:e_commerce/data_base/models/address/db_address_model.dart';

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
