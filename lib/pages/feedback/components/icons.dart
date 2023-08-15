import 'package:flutter/material.dart';

class IconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Tooltip(
            message: 'alibnsz',
            child: Image.asset(
              'assets/account/instagram.png',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Tooltip(
            message: 'mehmetalibunsuz',
            child: Image.asset(
              'assets/account/github.png',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Tooltip(
            message: 'alibnsz',
            child: Image.asset(
              'assets/account/twitter.png',
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
