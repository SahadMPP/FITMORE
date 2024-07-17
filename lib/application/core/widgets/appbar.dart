import 'package:e_commerce/Widgets/headline.dart';
import 'package:flutter/material.dart';

AppBar mainTitle(String text) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: HeadLine(text: text),
  );
}
