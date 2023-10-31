import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(left: 90),
            child: Text(
              'About Us',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: const [
              Text(
                  '          FitMore is your ultimate destination for premium footwear that combines style, comfort, and performance. We are dedicated to helping you find the perfect pair of shoes to match your lifestyle.'),
              SizedBox(height: 10),
              Text(
                  '          FitMore was born out of a passion for footwear and a desire to provide a platform where people could easily discover and purchase top-quality shoes. Established in [Year], we have since grown into a trusted source for all your footwear needs.'),
              SizedBox(height: 10),
              Text(
                  'Quality: We offer a meticulously curated selection of shoes from renowned brands'
                  'style: We believe that fashion and function can coexist, so we offer shoes that reflect your personal style.'
                  'Comfort: We prioritize comfort to ensure you can wear our shoes all day, every day'
                  'Customer Satisfaction: We are committed to delivering an exceptional shopping experience.')
            ],
          ),
        ));
  }
}
