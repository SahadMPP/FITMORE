import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:e_commerce/funtions/edit_profile_func.dart';
import 'package:flutter/material.dart';

class ChangePasswordWidget extends StatelessWidget {
  const ChangePasswordWidget({
    super.key,
    required this.foemKey,
    required TextEditingController oldPasswordEditcontroller,
    required TextEditingController newPasswordEditcontroller,
    required TextEditingController conformPasswordEditconstroller,
    required TextEditingController dbPasswordcontroller,
    required UserModel userModel,
  })  : _oldPasswordEditcontroller = oldPasswordEditcontroller,
        _newPasswordEditcontroller = newPasswordEditcontroller,
        _conformPasswordEditconstroller = conformPasswordEditconstroller,
        _dbPasswordcontroller = dbPasswordcontroller,
        _userModel = userModel;

  final GlobalKey<FormState> foemKey;
  final TextEditingController _oldPasswordEditcontroller;
  final TextEditingController _newPasswordEditcontroller;
  final TextEditingController _conformPasswordEditconstroller;
  final TextEditingController _dbPasswordcontroller;
  final UserModel _userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        changingPassword(
                            oldPasswordEditcontroller:
                                _oldPasswordEditcontroller,
                            newPasswordEditcontroller:
                                _newPasswordEditcontroller,
                            conformPasswordEditconstroller:
                                _conformPasswordEditconstroller,
                            dbPasswordcontroller: _dbPasswordcontroller,
                            userModel: _userModel,
                            context: context);
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
    );
  }
}
