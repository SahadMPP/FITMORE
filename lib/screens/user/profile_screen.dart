import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:e_commerce/screens/admin/admin_login.dart';
import 'package:e_commerce/screens/user/address_screen.dart';
import 'package:e_commerce/screens/user/edit_profile.dart';
import 'package:e_commerce/screens/user/login_screen.dart';
import 'package:e_commerce/screens/user/myorder_screen.dart';
import 'package:e_commerce/screens/user/terms_/terms.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 150),
          child: Text(
            'Profile',
            style: TextStyle(
              color: Color.fromARGB(255, 123, 123, 123),
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 35),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 110, top: 10),
                child: SizedBox(
                  height: 120,
                  width: 200,
                  child: selectedImage == null
                      ? const CircleAvatar(
                          backgroundImage:
                              AssetImage('asset/images (profile).jpg'),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(selectedImage!.path)),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 230, top: 100),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: InkWell(
                    onTap: () {
                      pickImageFromGallery();
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 215, 215, 215),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.place, size: 30, color: Colors.orange),
                    const Padding(
                      padding: EdgeInsets.only(right: 110),
                      child: Text(
                        'Address',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddressScreen(),
                          ));
                        },
                        child: const Icon(Icons.chevron_right, size: 35))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 215, 215, 215),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.person_add,
                        size: 25, color: Colors.orange),
                    const Padding(
                      padding: EdgeInsets.only(right: 120),
                      child: Text(
                        'Admin',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AdminLogin()));
                        },
                        child: const Icon(Icons.chevron_right, size: 35))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 215, 215, 215),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.privacy_tip,
                        size: 25, color: Colors.orange),
                    const Padding(
                      padding: EdgeInsets.only(right: 85),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TermsOne(),
                        ));
                      },
                      child: const Icon(
                        Icons.chevron_right,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 215, 215, 215),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.private_connectivity,
                        size: 25, color: Colors.orange),
                    const Padding(
                      padding: EdgeInsets.only(right: 50),
                      child: Text(
                        'Terms & Condition',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TermsOne(),
                        ));
                      },
                      child: const Icon(
                        Icons.chevron_right,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 215, 215, 215),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.history, size: 25, color: Colors.orange),
                    const Padding(
                      padding: EdgeInsets.only(right: 85),
                      child: Text(
                        'Order History',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyOrderScreen()));
                      },
                      child: const Icon(
                        Icons.chevron_right,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 215, 215, 215),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.edit, size: 25, color: Colors.orange),
                    const Padding(
                      padding: EdgeInsets.only(right: 85),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                      },
                      child: const Icon(
                        Icons.chevron_right,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Log Out?"),
                        content: const Text('Are you sure?'),
                        actions: [
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              signOut(context);
                            },
                          ),
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 215, 215, 215),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.logout, size: 25, color: Colors.orange),
                      Padding(
                        padding: EdgeInsets.only(right: 170),
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Color.fromARGB(255, 134, 134, 134),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  signOut(BuildContext ctx) async {
    final shareprefe = await SharedPreferences.getInstance();
    await shareprefe.clear();

    // ignore: use_build_context_synchronously
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const LoginScreen()),
        (route) => false);
  }

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) {
      return;
    }
    setState(() {
      selectedImage = File(returnedImage.path);
    });
    final bytes2 = await selectedImage!.readAsBytes();
    final String base64Image2 = base64Encode(bytes2);

    final profile = UserModel(
      profile: base64Image2,
    );
    userr.updateUser(0, profile);
  }

  // addProfile() async {
  //   final bytes2 = await selectedImage!.readAsBytes();
  //   final String base64Image2 = base64Encode(bytes2);

  //   final profile = UserModel(
  //     profile: base64Image2,
  //   );
  //   // userr.updateUser(,profile);
  // }
}
