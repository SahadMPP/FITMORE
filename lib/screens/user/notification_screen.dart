import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

int notificationCount = 1;

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> notificationImage = [
    'asset/images(notifica).jpg',
    'asset/images-b1.jpg',
    'asset/images-6.jpg',
    'asset/images-b3.jpg',
    'asset/images-b4.jpg',
  ];
  List<String> notificationtext = [
    'Hi Caitlyn Margusity, your pickup order is now! ready',
    'Hi sahad Mp, your pickup order is now! ready',
    'Hi jhon Mathew, your pickup order is now! ready',
    'Hi Spider Man, your pickup order is now! ready',
  ];
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
      background: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFE6E6),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 15, left: 15),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: 200,
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
                height: 110,
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
