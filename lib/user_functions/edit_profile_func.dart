import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:flutter/material.dart';

updateUserdetailsOnAclike(
    {required nameEditcontroller,
    required phonenumberEditcontroller,
    required emailEditconstroller,
    required userModel}) async {
  final name = nameEditcontroller.text;
  final phoneNum = phonenumberEditcontroller.text;
  final email = emailEditconstroller.text;
  final user = UserModel(
    name: name,
    phoneNumber: phoneNum,
    email: email,
  );
  userr.updateUser(userModel.id!, user);
}

changingPassword(
    {required oldPasswordEditcontroller,
    required newPasswordEditcontroller,
    required conformPasswordEditconstroller,
    required dbPasswordcontroller,
    required userModel,
    required context}) async {
  final oldpassword = oldPasswordEditcontroller.text;
  final newpassword = newPasswordEditcontroller.text;
  final conformPassword = conformPasswordEditconstroller.text;
  // ignore: unrelated_type_equality_checks
  if (dbPasswordcontroller != oldpassword) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      content: Text('Wrong old Password'),
    ));
    return;
  }
  if (newpassword != conformPassword) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      content: Text('Password does not match'),
    ));
    return;
  }

  if (userModel.password == oldpassword || newpassword == oldpassword) {
    final user = UserModel(password: newpassword);
    userr.updateUser(userModel.id!, user);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.fromARGB(255, 131, 131, 131),
      margin: EdgeInsets.all(15),
      content: Text('Password changed'),
    ));
  }
}
