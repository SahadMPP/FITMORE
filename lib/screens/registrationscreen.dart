import 'package:e_commerce/data_base/function/db_functions.dart';
import 'package:e_commerce/data_base/models/db_model.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
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
            const Text(
              'Complete Profile for your further move',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 136, 136, 136), fontSize: 15),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.person, color: Colors.grey),
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field is empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 25),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _phonenumberController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.phone_android, color: Colors.grey),
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field is empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.email_sharp, color: Colors.grey),
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field is empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: TextFormField(
                obscureText: true,
                controller: _passwordControlle,
                maxLength: 8,
                decoration: const InputDecoration(
                  labelText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.lock, color: Colors.grey),
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field is empty";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 255, 145, 0),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    isValid = EmailValidator.validate(_emailController.text);
                    if (isValid) {
                      if (formKey.currentState!.validate()) {
                        checkingUserAlreadyExiste(_emailController.text,
                            _passwordControlle.text, context);
                        onAddUserButtenClick(context);
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
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 55),
              child: Text(
                'By contining your conformation that you agree',
                style: TextStyle(color: Color.fromARGB(255, 136, 136, 136)),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.only(left: 110),
              child: Text(
                'With our terms and condition',
                style: TextStyle(color: Color.fromARGB(255, 136, 136, 136)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future onAddUserButtenClick(BuildContext context) async {
    final name = _nameController.text;
    final phonenumber = _phonenumberController.text;
    final email = _emailController.text;
    final password = _passwordControlle.text;
    if (name.isEmpty ||
        phonenumber.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(15),
        content: Text('Invalid User name and password'),
      ));
    }
    // print('$name $phonenumber $email $password');
    final usermodel = UserModel(
        name: name, phoneNumber: phonenumber, email: email, password: password);
    addUser(usermodel);

    if (name.isNotEmpty ||
        phonenumber.isNotEmpty ||
        email.isNotEmpty ||
        password.isNotEmpty) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  Future<void> checkingUserAlreadyExiste(
      String email, String password, BuildContext context) async {
    final userDB = await Hive.openBox<UserModel>('user_db');
    // UserModel? user;

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
            content: Text('Email Already redisted'),
          ));
        }
      }
    }
  }
}
