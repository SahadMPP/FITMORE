import 'package:e_commerce/Widgets/bottom_navigation_admin.dart';
import 'package:flutter/material.dart';

adminCheckLogin(BuildContext ctx,
    {required context,
    required adminEmailEditingCon,
    required adminPasswordEditingCon}) {
  final email = adminEmailEditingCon.text;
  final password = adminPasswordEditingCon.text;
  if (email == "sahad@gmail.com" || password == "12345") {
    Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const BottomNavigationAdmin()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      margin: EdgeInsets.all(15),
      content: Text('Invalid user name and password'),
    ));
  }
}
