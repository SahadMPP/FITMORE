import 'package:flutter/material.dart';

class H1headline extends StatelessWidget {
  final String text;
  const H1headline({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black, fontSize: 27),
    );
  }
}
