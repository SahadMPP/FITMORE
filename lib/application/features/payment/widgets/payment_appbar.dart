import 'package:flutter/material.dart';

AppBar paymentTitle(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: .2,
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.chevron_left,
          size: 30,
          color: Colors.grey,
        )),
    title: const Text(
      'Payment',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
