import 'package:flutter/material.dart';

class ProfileCardd extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTapp;
  const ProfileCardd({
    super.key,
    required this.title,
    required this.icon,
    required this.onTapp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35, left: 35),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(255, 215, 215, 215),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 30, color: Colors.orange),
              Padding(
                padding: const EdgeInsets.only(right: 110),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 134, 134, 134),
                    fontSize: 18,
                  ),
                ),
              ),
              GestureDetector(
                  onTap: onTapp,
                  child: const Icon(Icons.chevron_right, size: 35))
            ],
          ),
        ),
      ),
    );
  }
}
