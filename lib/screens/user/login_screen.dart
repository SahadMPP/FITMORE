import 'package:e_commerce/Widgets/h1_headline.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/text_field_reg.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/user_functions/login_screen_fun.dart';
import 'package:e_commerce/user_functions/profile_screen.dart';
import 'package:e_commerce/screens/user/registrationscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordControlle = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    userr.getAlluser();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: mainTitle('Sign In'),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const SizedBox(height: 50),
            const H1headline(text: 'Welcome Back'),
            const SizedBox(height: 12),
            const TextInResgistration(
                text: 'SignIn with your email Id and password'),
            const SizedBox(height: 70),
            TextFieldInReg(
              icon: Icons.email,
              labelText: "Email",
              hintText: 'Enter your email',
              validatorText: 'Field is empty',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              maxLength: null,
              nameController: _emailController,
            ),
            const SizedBox(height: 20),
            TextFieldInReg(
              icon: Icons.lock,
              labelText: "Password",
              hintText: 'Enter your password',
              validatorText: 'Field is empty',
              keyboardType: TextInputType.text,
              obscureText: false,
              maxLength: null,
              nameController: _passwordControlle,
            ),
            const SizedBox(height: 40),
            Button(
              text: 'Continue',
              onPressedCallback: () {
                if (formKey.currentState!.validate()) {
                  login(
                      _emailController.text, _passwordControlle.text, context);
                }
              },
            ),
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextInResgistration(text: 'Dont have account?'),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const RegScreen(),
                    ));
                  },
                  child: const Text(
                    'SignUp',
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
