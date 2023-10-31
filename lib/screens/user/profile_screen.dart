import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/Widgets/headline.dart';
import 'package:e_commerce/Widgets/profile_card.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/data_base/models/user/db_model.dart';
import 'package:e_commerce/screens/admin/admin_login.dart';
import 'package:e_commerce/screens/user/address_screen.dart';
import 'package:e_commerce/screens/user/edit_profile.dart';
import 'package:e_commerce/screens/user/login_screen.dart';
import 'package:e_commerce/screens/user/myorder_screen.dart';
import 'package:e_commerce/screens/user/terms_/about_us.dart';
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
          child: HeadLine(text: "Profile"),
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
          ProfileCardd(
            title: "Address",
            icon: Icons.location_city,
            onTapp: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddressScreen(),
              ));
            },
          ),
          const SizedBox(height: 10),
          ProfileCardd(
            title: "Admin",
            icon: Icons.person_add,
            onTapp: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AdminLogin(),
              ));
            },
          ),
          const SizedBox(height: 10),
          ProfileCardd(
            title: "About Us",
            icon: Icons.privacy_tip,
            onTapp: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AboutUs(),
              ));
            },
          ),
          const SizedBox(height: 10),
          ProfileCardd(
            title: "Terms",
            icon: Icons.private_connectivity,
            onTapp: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TermsOne(),
              ));
            },
          ),
          const SizedBox(height: 10),
          ProfileCardd(
            title: "Order",
            icon: Icons.history,
            onTapp: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MyOrderScreen(),
              ));
            },
          ),
          const SizedBox(height: 10),
          ProfileCardd(
            title: "Edit",
            icon: Icons.edit,
            onTapp: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditProfile(),
              ));
            },
          ),
          const SizedBox(height: 10),
          ProfileCardd(
            title: "Log Out",
            icon: Icons.logout,
            onTapp: () {
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
          ),
          const SizedBox(height: 10),
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
}
