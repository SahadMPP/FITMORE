import 'package:e_commerce/Widgets/h1_headline.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/text_field_reg.dart';
import 'package:e_commerce/admin_side_functions/admin_login_fun.dart';
import 'package:e_commerce/application/core/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _adminEmailEditingCon = TextEditingController();
  final _adminPasswordEditingCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mainTitle("Admin Login"),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 50),
          const H1headline(text: 'Welcome Admin'),
          const SizedBox(height: 12),
          const TextInResgistration(
              text: 'SignIn with your email Id and password'),
          const SizedBox(height: 90),
          TextFieldInReg(
            icon: Icons.email,
            labelText: 'Email',
            hintText: 'Enter your email',
            validatorText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            maxLength: null,
            nameController: _adminEmailEditingCon,
          ),
          const SizedBox(height: 20),
          TextFieldInReg(
            icon: Icons.lock,
            labelText: 'Password',
            hintText: 'Enter your Password',
            validatorText: 'Enter your Password',
            keyboardType: TextInputType.text,
            obscureText: false,
            maxLength: null,
            nameController: _adminPasswordEditingCon,
          ),
          const SizedBox(height: 40),
          Button(
              text: 'continue',
              onPressedCallback: () {
                adminCheckLogin(context,
                    context: context,
                    adminEmailEditingCon: _adminEmailEditingCon,
                    adminPasswordEditingCon: _adminPasswordEditingCon);
              }),
        ],
      ),
    );
  }
}
