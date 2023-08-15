import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const MyTextBox({
    super.key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primaryContainer),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          sectionName,
          style: TextStyle(color: Colors.grey.shade500),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontFamily: 'BebasNeue',
            fontSize: 20,
          ),
        ),
      ]),
    );
  }
}
