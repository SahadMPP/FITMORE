import 'package:flutter/material.dart';

class SponserBanner extends StatelessWidget {
  const SponserBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Padding(
            padding: EdgeInsets.only(right: 10, left: 5),
            child: Image(
              image: AssetImage('asset/552e7055d032d71f(1).webp'),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage('asset/download(spo 2).jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage('asset/images(spo 3).jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage('asset/images(spo 4).jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage('asset/images(spo 5).jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
