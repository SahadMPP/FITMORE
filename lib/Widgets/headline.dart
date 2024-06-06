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
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
