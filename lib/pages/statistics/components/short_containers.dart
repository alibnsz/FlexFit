import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class ShortContainer extends StatelessWidget {
  final color;
  final String image;
  final String title;
  final String subtitle;
  final String numbers;

  const ShortContainer(
      {super.key,
      this.color,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 175,
      padding:const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: color,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          children: [
            Image.asset(
              image,
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: kLabelTextStyle,
            ),
          ],
        ),
        Text(
          numbers,
          style: kNumberTextStyle,
        ),
        Text(
              subtitle,
              style: kLabelTextStyle,
            ),
      ]),
    );
  }
}
