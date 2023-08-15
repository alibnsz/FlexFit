import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SquareTile extends StatelessWidget {
  final String imagePath;
  void Function()? onTap;

  SquareTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.shade300),
        child: Image.asset(imagePath, height: 40),
      ),
    );
  }
}
