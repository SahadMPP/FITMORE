import 'package:e_commerce/Widgets/bottom_navigator.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
