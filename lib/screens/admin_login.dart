import 'package:e_commerce/screens/admin_list.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Admin Login',
            style: TextStyle(
              color: Color.fromARGB(255, 123, 123, 123),
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 50),
          const Text(
            'Welcome Admin',
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
          const SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              controller: _adminEmailEditingCon,
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
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
            child: TextFormField(
              controller: _adminPasswordEditingCon,
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
                  // if (fromkey1.currentState!.validate()) {
                  //   checkLogin(context);
                  // }
                  adminCheckLogin(context);
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
        ],
      ),
    );
  }

  adminCheckLogin(BuildContext ctx) {
    final email = _adminEmailEditingCon.text;
    final password = _adminPasswordEditingCon.text;
    if (email == "1" || password == "1") {
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const AdminList()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(15),
        content: Text('Invalid User name and password'),
      ));
    }
  }
}
