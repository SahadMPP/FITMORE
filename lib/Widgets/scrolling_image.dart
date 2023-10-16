import 'package:flutter/material.dart';

class ScrollingImageHome extends StatelessWidget {
  final String? image;
  const ScrollingImageHome({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.fill,
      image: AssetImage(image!),
      height: 265,
      width: 235,
    );
  }
}
