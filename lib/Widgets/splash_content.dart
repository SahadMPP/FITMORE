import 'package:flutter/material.dart';

class Splashcontent extends StatelessWidget {
  final String? text, image;
  const Splashcontent({
    this.text,
    this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text(
          'MENCART',
          style: TextStyle(
            fontSize: 36,
            color: Color.fromARGB(255, 245, 151, 28),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color.fromARGB(255, 151, 150, 150)),
        ),
        const Spacer(flex: 2),
        Image(
          image: AssetImage(image!),
          height: 265,
          width: 235,
        )
      ],
    );
  }
}
