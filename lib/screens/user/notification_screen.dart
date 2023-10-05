import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        elevation: 0,
        title: Column(
          children: [
            const Text(
              'Notification(1)',
              style: TextStyle(
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
      body: Dismissible(
        key: formKey,
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFE6E6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 280),
            child: Icon(
              Icons.delete,
              color: Color.fromARGB(255, 248, 55, 41),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 15, left: 15),
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            height: 220,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Min.30% off | Summer Sneakers',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 150,
                  width: 450,
                  child: Image(
                    image: AssetImage('asset/images(notifica).jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
