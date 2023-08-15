import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  final String text;
  const NotificationButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primaryContainer),
      padding: const EdgeInsets.only(left: 15, bottom: 15, top: 10),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SwitchListTile(
        dense: true,
        activeColor: Theme.of(context).colorScheme.primary,
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontFamily: 'BebasNeue',
              fontSize: 20),
        ),
        value: false,
        onChanged: (val) {},
      ),
    );
  }
}
