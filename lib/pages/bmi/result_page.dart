import 'package:flutter/material.dart';
import '../../components/constants.dart';
import 'components/calculate_button.dart';
import 'components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ReusableCard(
              colour: Theme.of(context).colorScheme.background,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kLabelTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 40,
                      fontFamily: 'BrunoAce',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    style: kLabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            BmiButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'RE-CALCULATE',
            )
          ],
        ),
      ),
    );
  }
}
