import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mainbutton extends StatefulWidget {
  String? text;
  String? page;
  Mainbutton({super.key, this.text, this.page});

  @override
  State<Mainbutton> createState() => _MainbuttonState();
}

class _MainbuttonState extends State<Mainbutton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 255, 145, 0),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          onPressed: () {},
          child: Text(
            widget.text!,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
