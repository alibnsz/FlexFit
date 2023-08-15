import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAlertButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyAlertButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ));
  }
}
