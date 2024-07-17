import 'package:e_commerce/Widgets/bottom_navigator.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/screens/user/login_screen.dart';
import 'package:e_commerce/screens/user/second_sp.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGet extends GetxController {
  Future<void> checkUserLogin(BuildContext ctx) async {
    final sharedpreference = await SharedPreferences.getInstance();
    final userLogiddIn = sharedpreference.getBool(SAVE_KEY_NAME);
    if (userLogiddIn == null || userLogiddIn == false) {
      await Future.delayed(const Duration(seconds: 3));

      // ignore: use_build_context_synchronously
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: ((ctx) => const LoginScreen())));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: ((ctx) => const SecondSp())));
    }
  }


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


Future<void> login(String email, String password, BuildContext context) async {
  final userDB = await Hive.openBox<UserModel>('user_db');
  UserModel? user;

  // ignore: unnecessary_null_comparison
  if (userDB != null) {
    for (var i = 0; i < userDB.length; i++) {
      final currentUser = userDB.getAt(i);
      if (currentUser!.email == email && currentUser.password == password) {
        user = currentUser;
        break;
      }
    }
  }
  if (user == null) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      content: Text('User not registed'),
    ));
    return;
  }

  if (user.active == false) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      content: Text('User is Blocked'),
    ));
    return;
  }

  if (user.active == true) {
    final shareprefe = await SharedPreferences.getInstance();
    await shareprefe.setBool(SAVE_KEY_NAME, true);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: ((ctx) => const BottomNavigator())),
        (Route<dynamic> route) => false);
  } else {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      content: Text('Invalid User name and password'),
    ));
  }
}


AnimatedContainer buildDot({int? index, crrentpage}) {
  return AnimatedContainer(
    duration: kThemeAnimationDuration,
    margin: const EdgeInsets.only(right: 5),
    height: 6,
    width: crrentpage == index ? 20 : 6,
    decoration: BoxDecoration(
      color: crrentpage == index
          ? const Color.fromARGB(255, 232, 138, 16)
          : const Color(0xFFD8D8D8),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}


}
