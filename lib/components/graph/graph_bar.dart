
import 'package:flutter/material.dart';
import 'bar.dart';

class BarGraph extends StatefulWidget {
  const BarGraph({super.key});

  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  List<double> weeklySummary = [
    75.50,
    44.42,
    66.50,
    55.20,
    88,
    80,
    90.20,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.only(bottom: 20),
        height: 250,
        decoration: BoxDecoration(
          color: Colors.limeAccent.shade400,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Center(
          child: MyBarGraph(weeklySummary: weeklySummary),
        ),
      ),
    ]);
  }
}
