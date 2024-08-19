import 'package:e_commerce/utils/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TermsOne extends StatelessWidget {
  const TermsOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Privacy Policy',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: ListView(
            children: [
              Text(
                  '1.Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',
                  style: TextStyles.bodyText2),
              SizedBox(height: 2.sh),
              Text(
                  '2.Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',
                  style: TextStyles.bodyText2),
              Text(
                  'Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',
                  style: TextStyles.bodyText2),
              Text(
                  'Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',
                  style: TextStyles.bodyText2),
              SizedBox(height: 2.sh),
              Text(
                  '3.Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',
                  style: TextStyles.bodyText2),
              Text(
                  'Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',
                  style: TextStyles.bodyText2),
              SizedBox(height: 2.sh),
              Text(
                  '4.Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',
                  style: TextStyles.bodyText2),
              Text(
                  'Personal Information: We may collect personal information such as your name, email address, phone number, and shipping address when you register or make a purchase through our Service.',
                  style: TextStyles.bodyText2),
            ],
          ),
        ));
  }
}
