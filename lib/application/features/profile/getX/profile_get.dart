import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:e_commerce/screens/user/login_screen.dart';
import 'package:e_commerce/utils/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ProfileGet extends GetxController {
  UserFunction userr = UserFunction();

  var selectedImage = Rxn<File>();

  late UserModel userModel;

  initialdata() async {
    SharedPreferences sharepeference = await SharedPreferences.getInstance();
    final id = sharepeference.getString('USER_ID');
    userModel = await userr.getUserById(int.parse(id.toString()));
  }

  signOut(BuildContext ctx) {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Are your sure to Logout?", style: TextStyles.heading2,textAlign: TextAlign.center,),
      actionsPadding: EdgeInsets.all(24.sp),
      actions: [
          IconButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () async {
                final shareprefe = await SharedPreferences.getInstance();
                await shareprefe.clear();
                // ignore: use_build_context_synchronously
                Navigator.of(ctx).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx) => const LoginScreen()),
                    (route) => false);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.grey,
              )),
      ],
    ));
  }

  updateUserdetailsOnAclike({
    required TextEditingController nameEditcontroller,
    required TextEditingController phonenumberEditcontroller,
    required TextEditingController emailEditconstroller,
    required UserModel userModel,
  }) async {
    final name = nameEditcontroller.text;
    final phoneNum = phonenumberEditcontroller.text;
    final email = emailEditconstroller.text;
    final user = UserModel(
      name: name,
      phoneNumber: phoneNum,
      email: email,
    );
    userr.updateUser(userModel.id!, user);
  }

  changingPassword({
    required TextEditingController oldPasswordEditcontroller,
    required TextEditingController newPasswordEditcontroller,
    required TextEditingController conformPasswordEditconstroller,
    required String dbPasswordcontroller,
    required UserModel userModel,
    required BuildContext context,
  }) async {
    final oldpassword = oldPasswordEditcontroller.text;
    final newpassword = newPasswordEditcontroller.text;
    final conformPassword = conformPasswordEditconstroller.text;
    if (dbPasswordcontroller != oldpassword) {
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

    if (userModel.password == oldpassword || newpassword == oldpassword) {
      final user = UserModel(password: newpassword);
      userr.updateUser(userModel.id!, user);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 131, 131, 131),
        margin: EdgeInsets.all(15),
        content: Text('Password changed'),
      ));
    }
  }

  Future<void> pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage != null) {
      selectedImage.value = File(returnedImage.path);
      final bytes2 = await selectedImage.value!.readAsBytes();
      final String base64Image2 = base64Encode(bytes2);
      final profile = UserModel(
        profile: base64Image2,
      );
      userr.updateUser(0, profile); // Update the user ID accordingly
    }
  }
}
