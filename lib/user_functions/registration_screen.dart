import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:e_commerce/screens/user/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> checkingUserAlreadyExiste(BuildContext context,
    {required emailController,
    required nameController,
    required phonenumberController,
    required passwordControlle}) async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  final email = emailController.text;

  // ignore: unnecessary_null_comparison
  if (userDB != null) {
    for (var i = 0; i < userDB.length; i++) {
      final currentUser = userDB.getAt(i);
      if (currentUser!.email == email) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(15),
          content: Text('Email Already registered'),
        ));
        return;
      }
    }
  }

  final name = nameController.text;
  final phonenumber = phonenumberController.text;
  final password = passwordControlle.text;

  if (name.isEmpty ||
      phonenumber.isEmpty ||
      email.isEmpty ||
      password.isEmpty) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      content: Text('Invalid User name and password'),
    ));
  } else {
    final usermodel = UserModel(
      name: name,
      phoneNumber: phonenumber,
      email: email,
      password: password,
    );
    userr.addUser(usermodel);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
