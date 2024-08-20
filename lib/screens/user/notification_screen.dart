import 'package:e_commerce/Widgets/nitification_card.dart';
import 'package:e_commerce/application/core/const/const_values.dart';
import 'package:e_commerce/application/features/notification/ui/notification_ui.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        elevation: 0,
        title: Column(
          children: [
            Text(
              'Notification($notificationCount)',
              style: const TextStyle(
                color: Color.fromARGB(255, 58, 58, 58),
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 90),
              child: Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 215, 237, 255),
                  border: Border.all(width: 2, color: Colors.blue),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    'All',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: notificationCount,
        itemBuilder: (context, index) {
          return NotificationCard(
            text: notificationtext[index],
            image: notificationImage[index],
          );
        },
      ),
    );
  }
}
