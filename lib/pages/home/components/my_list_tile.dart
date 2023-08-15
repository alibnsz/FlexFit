import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  void Function()? onTap;
  final String text;
  MyListTile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        text,
      ),
    );
  }
}
