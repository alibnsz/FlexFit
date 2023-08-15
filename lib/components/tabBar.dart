import 'package:flutter/material.dart';

class MyTabBarIcon extends StatelessWidget {
  final String text;
  final String image;
  const MyTabBarIcon({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
              fontFamily: 'BrunoAce',
              fontWeight: FontWeight.bold),
        ),
        Image.asset(
          image,
          color: Theme.of(context).colorScheme.primary,
          height: 30,
        )
      ],
    );
  }
}
