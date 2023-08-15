import 'package:flutter/material.dart';

import '../../../components/constants.dart';

// ignore: must_be_immutable
class ProfileTile extends StatelessWidget {
  void Function()? onPressed;
  final String iconImage;
  final String text;
  ProfileTile(
      {super.key,
      required this.onPressed,
      required this.iconImage,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 170,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              iconImage,
              width: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              text,
              style: kLabelTextStyle,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
