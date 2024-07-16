import 'package:e_commerce/application/features/profile/widgets/option_title_ui.dart';
import 'package:e_commerce/application/features/profile/widgets/profile_deatile_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileUi extends StatelessWidget {
  const ProfileUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://wallpapers.com/images/high/best-profile-pictures-2h94ge4qz9y05dbw.webp'), // Replace with your image URL
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
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
                        icon: Icons.cake,
                        title: 'Date of birth',
                        value: '20.09.1992',
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
                  icon: Icons.support,
                  title: 'Crisis Support',
                  onTap: () {},
                ),
                OptionTile(
                  icon: Icons.lock,
                  title: 'Change password',
                  onTap: () {},
                ),
                OptionTile(
                  icon: Icons.help,
                  title: 'Help',
                  onTap: () {},
                ),
                OptionTile(
                  icon: Icons.health_and_safety,
                  title: 'The Health App',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


