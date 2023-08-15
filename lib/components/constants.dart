import 'dart:math';
import 'package:flutter/material.dart';

const kLabelTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color.fromARGB(255, 87, 87, 87),
  fontFamily: 'BebasNeue',
);

const kNumberTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
  color: Colors.black,
  fontFamily: 'BebasNeue',
);

BoxShadow shadowBottom = BoxShadow(
  color: Colors.grey.shade800,
  offset: const Offset(-1, -1),
  blurRadius: 1,
  spreadRadius: 0,
);
int randomStep() {
  final random = Random();
  return random.nextInt(20000);
}

int randomKcal() {
  final random = Random();
  return random.nextInt(3000);
}

int randomBpm() {
  final random = Random();
  return random.nextInt(40) + 61;
}
