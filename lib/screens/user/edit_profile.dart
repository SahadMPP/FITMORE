import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> foemKey = GlobalKey<FormState>();
  late TextEditingController _nameEditcontroller;
  late TextEditingController _phonenumberEditcontroller;
  late TextEditingController _emailEditconstroller;
  late TextEditingController _dbPasswordcontroller;

  final _oldPasswordEditcontroller = TextEditingController();
  final _newPasswordEditcontroller = TextEditingController();
  final _conformPasswordEditconstroller = TextEditingController();

  late UserModel _userModel;

  @override
  void initState() {
    _nameEditcontroller = TextEditingController();
    _phonenumberEditcontroller = TextEditingController();
    _emailEditconstroller = TextEditingController();
    _dbPasswordcontroller = TextEditingController();

    final userlist = userListNotifier.value;

    if (userlist.isNotEmpty) {
      _userModel = userlist[0];
      _nameEditcontroller.text = _userModel.name!;
      _phonenumberEditcontroller.text = _userModel.phoneNumber!;
      _emailEditconstroller.text = _userModel.email!;
      _dbPasswordcontroller.text = _userModel.password!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameEditcontroller.dispose();
    _phonenumberEditcontroller.dispose();
    _emailEditconstroller.dispose();
    _dbPasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 40),
          const Text(
            'Edit Profile',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 27),
          ),
          const SizedBox(height: 62),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              controller: _nameEditcontroller,
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
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 25),
            child: TextFormField(
              controller: _phonenumberEditcontroller,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              controller: _emailEditconstroller,
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
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 236, 236, 236),
                    actionsPadding: const EdgeInsets.all(10),
                    title: const Text('Change your pasword'),
                    content: SingleChildScrollView(
                      child: Form(
                        key: foemKey,
                        child: Column(
                          children: [
                            const Text(
                              'Enter your old password',
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Old password";
                                } else {
                                  return null;
                                }
                              },
                              controller: _oldPasswordEditcontroller,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            const SizedBox(height: 10),
                            const Text('Enter your new password'),
                            const SizedBox(height: 10),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "New password";
                                } else {
                                  return null;
                                }
                              },
                              controller: _newPasswordEditcontroller,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            const SizedBox(height: 10),
                            const Text('Conform password'),
                            const SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if (value != _newPasswordEditcontroller.text) {
                                  return "password not match";
                                } else {
                                  return null;
                                }
                              },
                              controller: _conformPasswordEditconstroller,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            if (foemKey.currentState!.validate()) {
                              changingPassword();
                            }
                          },
                          child: const Text('Submit')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close')),
                    ],
                  ),
                );
              },
              child: const Text(
                'Update your password',
                textAlign: TextAlign.end,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
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
                  updateUserdetailsOnAclike();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Update',
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

  updateUserdetailsOnAclike() async {
    final name = _nameEditcontroller.text;
    final phoneNum = _phonenumberEditcontroller.text;
    final email = _emailEditconstroller.text;
    final user = UserModel(
      name: name,
      phoneNumber: phoneNum,
      email: email,
    );
    userr.updateUser(_userModel.id!, user);
  }

  changingPassword() async {
    final oldpassword = _oldPasswordEditcontroller.text;
    final newpassword = _newPasswordEditcontroller.text;
    final conformPassword = _conformPasswordEditconstroller.text;
    // ignore: unrelated_type_equality_checks
    if (_dbPasswordcontroller != oldpassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(15),
        content: Text('Wrong old Password'),
      ));
      return;
    }
    if (newpassword != conformPassword) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(15),
        content: Text('Password does not match'),
      ));
      return;
    }

    if (_userModel.password == oldpassword || newpassword == oldpassword) {
      final user = UserModel(password: newpassword);
      userr.updateUser(_userModel.id!, user);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 131, 131, 131),
        margin: EdgeInsets.all(15),
        content: Text('Password changed'),
      ));
    }
  }
}
