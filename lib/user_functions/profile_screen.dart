import 'package:e_commerce/Widgets/headline.dart';
import 'package:e_commerce/screens/user/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

signOut(BuildContext ctx) async {
  final shareprefe = await SharedPreferences.getInstance();
  await shareprefe.clear();

  // ignore: use_build_context_synchronously
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => const LoginScreen()),
      (route) => false);
}

AppBar mainTitle(String text) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Padding(
      padding: const EdgeInsets.only(left: 110),
      child: HeadLine(text: text),
    ),
  );
}
