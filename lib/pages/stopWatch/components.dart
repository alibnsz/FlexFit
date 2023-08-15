import 'package:flutter/material.dart';

class MyWatchButton extends StatelessWidget {
  void Function()? onTap;

  final String image;

  MyWatchButton({
    super.key,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.limeAccent.shade400,
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(image, height: 25),
          ],
        )),
      ),
    );
  }
}
