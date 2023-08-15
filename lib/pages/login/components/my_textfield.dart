import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary, fontSize: 18),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade900),
            ),
            fillColor: Theme.of(context).colorScheme.primaryContainer,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: 'BebasNeue')),
        cursorColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
