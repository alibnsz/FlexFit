import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/constants.dart';
import '../../components/tabBar.dart';
import 'components/calculate_button.dart';
import 'components/icon_content.dart';
import 'components/reusable_card.dart';
import 'components/plus_minus_buttons.dart';
import 'result_page.dart';
import 'utils/calculate_bmi.dart';

enum Gender {
  male,
  female,
}

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  var selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const MyTabBarIcon(
                  text: 'B M I',
                  image: 'assets/tabbar/bmi.png',
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? Color.fromARGB(255, 131, 240, 131)
                            : Theme.of(context).colorScheme.primary,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.person,
                          label: 'MALE',
                          iconColor: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? Color.fromARGB(255, 131, 240, 131)
                            : Theme.of(context).colorScheme.primary,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.female,
                          label: 'FEMALE',
                          iconColor: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
                ReusableCard(
                  colour: Theme.of(context).colorScheme.primary,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 40,
                                  fontFamily: 'BebasNeue')),
                          const SizedBox(width: 5),
                          const Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.grey.shade800,
                          activeTrackColor:
                              Theme.of(context).colorScheme.secondary,
                          thumbColor: Theme.of(context).colorScheme.secondary,
                          overlayColor: Colors.limeAccent[400],
                          trackHeight: 12,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 20.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 0.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: Theme.of(context).colorScheme.primary,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(weight.toString(),
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 40,
                                    fontFamily: 'BebasNeue')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                const SizedBox(width: 10.0),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: Theme.of(context).colorScheme.primary,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(age.toString(),
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 40,
                                    fontFamily: 'BebasNeue')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(
                                      () {
                                        age--;
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(width: 12.0),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                BmiButton(
                  onTap: () {
                    BmiLogic calc = BmiLogic(height: height, weight: weight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsPage(
                                  bmiResult: calc.calculateBMI(),
                                  resultText: calc.getResult(),
                                  interpretation: calc.getInterpretation(),
                                )));
                  },
                  text: 'CALCULATE',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
