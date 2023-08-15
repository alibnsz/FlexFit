import 'package:flutter/material.dart';
import '../../../components/constants.dart';

class MyCards extends StatelessWidget {
  final String backgroundImage;
  final String icon;
  final String title;
  final String subtitle;
  void Function()? onTap;
  MyCards(
      {super.key,
      required this.backgroundImage,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              backgroundImage,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.23,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 45,
            top: 45,
            child: Column(
              children: [
                Image.asset(
                  icon,
                  height: 50,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'BrunoAce'),
                ),
                Text(
                  subtitle,
                  style: kLabelTextStyle,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Icon(
              Icons.touch_app,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
