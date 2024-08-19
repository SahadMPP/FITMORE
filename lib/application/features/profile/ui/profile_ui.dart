import 'dart:io';

import 'package:e_commerce/application/features/profile/getX/profile_get.dart';
import 'package:e_commerce/application/features/profile/widgets/option_title_ui.dart';
import 'package:e_commerce/application/features/profile/widgets/profile_deatile_row.dart';
import 'package:e_commerce/screens/admin/admin_login.dart';
import 'package:e_commerce/screens/user/address_screen.dart';
import 'package:e_commerce/screens/user/edit_profile.dart';
import 'package:e_commerce/screens/user/myorder_screen.dart';
import 'package:e_commerce/application/features/terms/ui/about_us.dart';
import 'package:e_commerce/application/features/terms/ui/terms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileUi extends StatelessWidget {
  const ProfileUi({super.key});

  @override
  Widget build(BuildContext context) {
    final profileGet = Get.put(ProfileGet());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Stack(
                  children: [
                    Obx(
                      () => Center(
                        child: profileGet.selectedImage.value == null
                            ? const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('asset/images (profile).jpg'),
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                    File(profileGet.selectedImage.value!.path)),
                              ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: MediaQuery.of(context).size.width * .52,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: InkWell(
                          onTap: () {
                            profileGet.pickImageFromGallery();
                          },
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Richard Doe',
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Status: Active',
                  style: GoogleFonts.roboto(color: Colors.grey),
                ),
                const SizedBox(height: 22),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileDetailRow(
                        icon: Icons.email,
                        title: 'Email',
                        value: 'richarddoe@gmail.com',
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      const ProfileDetailRow(
                        icon: Icons.phone,
                        title: 'Phone Number',
                        value: '123-456-7890',
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      const ProfileDetailRow(
                        icon: Icons.person,
                        title: 'Gender',
                        value: 'Male',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                OptionTile(
                  icon: Icons.person_pin_outlined,
                  title: 'Admin Login',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AdminLogin(),
                    ));
                  },
                ),
                OptionTile(
                  icon: Icons.location_city_rounded,
                  title: 'Address',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddressScreen(),
                    ));
                  },
                ),
                OptionTile(
                  icon: Icons.help,
                  title: 'About',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ));
                  },
                ),
                OptionTile(
                  icon: Icons.privacy_tip,
                  title: 'Terms',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TermsOne(),
                    ));
                  },
                ),
                OptionTile(
                  icon: Icons.history,
                  title: 'Order History',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyOrderScreen(),
                    ));
                  },
                ),
                OptionTile(
                  icon: Icons.edit_calendar_rounded,
                  title: 'Edit',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ));
                  },
                ),
                OptionTile(
                  icon: Icons.logout,
                  title: 'LogOut',
                  onTap: () {
                    profileGet.signOut(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
