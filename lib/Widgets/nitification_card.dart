import 'package:e_commerce/screens/user/notification_screen.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.text,
    required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Dismissible(
      key: formKey,
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        notificationCount--;
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 15, left: 15),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 130,
                width: 450,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
