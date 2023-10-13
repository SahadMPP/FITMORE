import 'package:e_commerce/Widgets/bottom_navigator.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/screens/user/registrationscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordControlle = TextEditingController();

  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // Unique key for the Form
  GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(); // Key for the Scaffold

  @override
  Widget build(BuildContext context) {
    userr.getAlluser();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Sign In',
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
          padding: const EdgeInsets.all(10),
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome Back',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
            const SizedBox(height: 12),
            const Text(
              'SignIn with your email Id and password',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 136, 136, 136), fontSize: 15),
            ),
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.all(20),
                  suffixIcon: Icon(Icons.email, color: Colors.grey),
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Error";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
              child: TextFormField(
                controller: _passwordControlle,
                obscureText: true,
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
                    return "Error";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 40),
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
                    if (formKey.currentState!.validate()) {
                      login(_emailController.text, _passwordControlle.text,
                          context);
                    }
                  },
                  child: const Text(
                    'continue',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont have account?',
                  style: TextStyle(color: Color.fromARGB(255, 136, 136, 136)),
                ),
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

  Future<void> login(
      String email, String password, BuildContext context) async {
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
}
