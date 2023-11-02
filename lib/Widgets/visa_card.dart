import 'package:flutter/material.dart';

class PassingPaymImage extends StatelessWidget {
  const PassingPaymImage({
    super.key,
    required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Image(
      image: AssetImage(image),
      width: 70,
    ));
  }
}
