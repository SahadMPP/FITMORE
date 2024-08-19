import 'package:e_commerce/utils/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'About Us',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: ListView(
            children: [
              Text(
                '          FitMore is your ultimate destination for premium footwear that combines style, comfort, and performance. We are dedicated to helping you find the perfect pair of shoes to match your lifestyle.',
                style: TextStyles.bodyText2,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 2.sh),
              Text(
                  '          FitMore was born out of a passion for footwear and a desire to provide a platform where people could easily discover and purchase top-quality shoes. Established in [Year], we have since grown into a trusted source for all your footwear needs.',
                  style: TextStyles.bodyText2,
                  textAlign: TextAlign.justify),
              SizedBox(height: 2.sh),
              Text(
                  'Quality: We offer a meticulously curated selection of shoes from renowned brands'
                  'style: We believe that fashion and function can coexist, so we offer shoes that reflect your personal style.'
                  'Comfort: We prioritize comfort to ensure you can wear our shoes all day, every day'
                  'Customer Satisfaction: We are committed to delivering an exceptional shopping experience.',
                  style: TextStyles.bodyText2,
                  textAlign: TextAlign.justify)
            ],
          ),
        ));
  }
}
