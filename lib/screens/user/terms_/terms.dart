import 'package:flutter/material.dart';

class TermsOne extends StatelessWidget {
  const TermsOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Privacy Policy',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: const [
              Text(
                  '1.Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.justify),
              SizedBox(height: 30),
              Text(
                  '2.Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.justify),
              Text(
                  'Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.justify),
              Text(
                  'Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.justify),
              SizedBox(height: 30),
              Text(
                  '3.Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.justify),
              Text(
                  'Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.justify),
              SizedBox(height: 30),
              Text(
                  '4.Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.justify),
              Text(
                  'Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),textAlign: TextAlign.justify),
            ],
          ),
        ));
  }
}
