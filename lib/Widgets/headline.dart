import 'package:flutter/material.dart';

class HeadLine extends StatelessWidget {
  final String text;
  const HeadLine({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 123, 123, 123),
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
