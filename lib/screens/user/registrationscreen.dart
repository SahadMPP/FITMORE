import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/text_field_reg.dart';
import 'package:e_commerce/user_functions/registration_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:email_validator/email_validator.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _nameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordControlle = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isValid = false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Color.fromARGB(255, 123, 123, 123),
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Complete Profile',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
            const SizedBox(height: 12),
            const TextInResgistration(
                text: 'Complete profile for your further move'),
            const SizedBox(height: 40),
            TextFieldInReg(
              icon: Icons.person,
              labelText: 'name',
              hintText: 'Enter your name',
              validatorText: 'Field is empty',
              keyboardType: TextInputType.name,
              nameController: _nameController,
              maxLength: null,
              obscureText: false,
            ),
            const SizedBox(height: 15),
            TextFieldInReg(
              icon: Icons.phone_android,
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
              validatorText: "Field is empty",
              nameController: _phonenumberController,
              keyboardType: TextInputType.phone,
              maxLength: null,
              obscureText: false,
            ),
            const SizedBox(height: 15),
            TextFieldInReg(
              icon: Icons.email_sharp,
              labelText: 'Email',
              hintText: 'Enter your Email',
              validatorText: "Field is empty",
              nameController: _emailController,
              keyboardType: TextInputType.text,
              maxLength: null,
              obscureText: false,
            ),
            const SizedBox(height: 15),
            TextFieldInReg(
              icon: Icons.lock,
              labelText: 'Password',
              hintText: 'Enter your Password',
              validatorText: "Field is Password",
              nameController: _passwordControlle,
              keyboardType: TextInputType.text,
              maxLength: null,
              obscureText: false,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: TextFormField(
                obscureText: true,
                maxLength: 8,
                decoration: const InputDecoration(
                  labelText: "Conform Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.lock, color: Colors.grey),
                  hintText: 'Enter your conform password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value != _passwordControlle.text) {
                    return "password not match";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Button(
              text: 'Continue',
              onPressedCallback: () {
                isValid = EmailValidator.validate(_emailController.text);
                if (isValid) {
                  if (formKey.currentState!.validate()) {
                    checkingUserAlreadyExiste(context,
                        emailController: _emailController,
                        nameController: _nameController,
                        phonenumberController: _phonenumberController,
                        passwordControlle: _passwordControlle);
                  }
                } else if (_emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red,
                    margin: EdgeInsets.all(15),
                    content: Text('Enter Email'),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red,
                    margin: EdgeInsets.all(15),
                    content: Text('Enter a valid email'),
                  ));
                }
              },
            ),
            const SizedBox(height: 20),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: TextInResgistration(
                    text: 'By contining your conformation that you agree')),
            const SizedBox(height: 5),
            const Padding(
                padding: EdgeInsets.only(left: 40),
                child:
                    TextInResgistration(text: 'With our terms and condition')),
          ],
        ),
      ),
    );
  }
}
