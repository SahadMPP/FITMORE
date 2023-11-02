import 'package:flutter/material.dart';

List<Map<String, String>> splashData = [
  {
    'text': 'Welcome to FitMore,Lets shop!',
    'image': 'asset/splash_1.png',
  },
  {
    'text': 'Welcome help people conect with state of America',
    'image': 'asset/splash_2.png',
  },
  {
    'text': 'We show the easy way to shop. \njust stay at home with us',
    'image': 'asset/splash_3.png',
  }
];

AnimatedContainer buildDot({int? index, crrentpage}) {
  return AnimatedContainer(
    duration: kThemeAnimationDuration,
    margin: const EdgeInsets.only(right: 5),
    height: 6,
    width: crrentpage == index ? 20 : 6,
    decoration: BoxDecoration(
      color: crrentpage == index
          ? const Color.fromARGB(255, 232, 138, 16)
          : const Color(0xFFD8D8D8),
      borderRadius: BorderRadius.circular(3),
    ),
  );
}
