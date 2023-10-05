import 'dart:io';
import 'package:e_commerce/screens/admin/admin_login.dart';
import 'package:e_commerce/screens/user/edit_profile.dart';
import 'package:e_commerce/screens/user/login_screen.dart';
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
      body: Column(
        children: [
          const SizedBox(height: 35),
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 65,
                child: selectedImage == null
                    ? Image.asset(
                        'asset/images (profile).jpg',
                        fit: BoxFit.fill,
                      )
                    : Image.file(
                        File(selectedImage!.path),
                        fit: BoxFit.fill,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90, top: 90),
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
              height: 70,
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
                    const Icon(Icons.person, size: 30, color: Colors.orange),
                    const Padding(
                      padding: EdgeInsets.only(right: 80),
                      child: Text(
                        'My Account',
                        style: TextStyle(
                          color: Color.fromARGB(255, 134, 134, 134),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.chevron_right, size: 35))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: Container(
              height: 70,
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
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(right: 35, left: 35),
            child: Container(
              height: 70,
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
                      padding: EdgeInsets.only(right: 130),
                      child: Text(
                        'Edit',
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
          const SizedBox(height: 25),
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
                height: 70,
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
  }
}
