import 'package:flutter/material.dart';

class MyNutritionButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final color;
  const MyNutritionButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 25,
              fontFamily: 'BebasNeue',
            ),
          ),
        ),
      ),
    );
  }
}
