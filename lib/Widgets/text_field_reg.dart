import 'package:flutter/material.dart';

class TextFieldInReg extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String validatorText;
  final IconData icon;
  final TextEditingController? nameController;
  final TextInputType keyboardType;
  final bool obscureText;
  final dynamic maxLength;
  const TextFieldInReg({
    super.key,
    required this.icon,
    required this.labelText,
    required this.hintText,
    required this.validatorText,
    this.nameController,
    required this.keyboardType,
    required this.obscureText,
    required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: nameController,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.all(20),
          suffixIcon: Icon(icon, color: Colors.grey),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorText;
          } else {
            return null;
          }
        },
      ),
    );
  }
}

class TextInResgistration extends StatelessWidget {
  final String text;
  const TextInResgistration({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Color.fromARGB(255, 136, 136, 136), fontSize: 15),
    );
  }
}
