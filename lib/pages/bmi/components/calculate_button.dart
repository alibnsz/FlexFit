import 'package:flutter/material.dart';

class BmiButton extends StatelessWidget {
  final String text;
  void Function()? onTap;

  BmiButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    int height = 180;
    int weight = 60;
    int age = 20;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(15),
        width: 350,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 131, 240, 131),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontFamily: 'BebasNeue', fontSize: 25),
          ),
        ),
      ),
    );
  }
}
