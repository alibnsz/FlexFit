import 'package:flutter/material.dart';
import '../../../components/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label, this.iconColor});

  final IconData icon;
  final String label;
  final iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: iconColor, size: 50.0),
        const SizedBox(height: 15.0),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
