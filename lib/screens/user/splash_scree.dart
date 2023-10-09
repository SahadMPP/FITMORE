import 'package:e_commerce/main.dart';
import 'package:e_commerce/screens/user/login_screen.dart';
import 'package:e_commerce/screens/user/second_sp.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // gotoSecondScreen(context);
    checkUserLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'MENCART',
          style: TextStyle(
            fontSize: 36,
            color: Color.fromARGB(255, 245, 151, 28),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

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
