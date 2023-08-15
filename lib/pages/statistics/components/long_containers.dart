import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class LongContainer extends StatelessWidget {
  final color;
  final String title;
  final String numbers;
  final String subtitle;
  final String image;
  final String title2;
  final String numbers2;
  final String subtitle2;
  final String image2;
  const LongContainer({
    super.key,
    this.color,
    required this.title,
    required this.numbers,
    required this.subtitle,
    required this.image,
    required this.title2,
    required this.numbers2,
    required this.subtitle2,
    required this.image2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260,
        width: 175,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: color,
        ),
        child: Column(
          children: [
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
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              children: [
                Image.asset(
                  image2,
                  height: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  title2,
                  style: kLabelTextStyle,
                ),
              ],
            ),
            Text(
              numbers2,
              style: kNumberTextStyle,
            ),
            Text(
              subtitle2,
              style: kLabelTextStyle,
            ),
          ],
        ));
  }
}
