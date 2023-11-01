import 'package:e_commerce/main.dart';
import 'package:e_commerce/screens/user/login_screen.dart';
import 'package:e_commerce/screens/user/second_sp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
