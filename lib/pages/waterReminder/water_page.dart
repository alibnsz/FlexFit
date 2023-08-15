import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../components/constants.dart';
import '../../components/tabBar.dart';
import '../login/components/my_login_button.dart';

class WaterReminderScreen extends StatefulWidget {
  @override
  _WaterReminderScreenState createState() => _WaterReminderScreenState();
}

class _WaterReminderScreenState extends State<WaterReminderScreen> {
  int dailyWaterGoal = 2000; // Günlük içilmesi gereken su miktarı (ml)
  int consumedWater = 0; // Bugün içilen su miktarı (ml)
  int remainingWater = 2000; // Kalan içilmesi gereken su miktarı (ml)

  TextEditingController valueController = TextEditingController();

  void updateWaterIntake(int amount) {
    setState(() {
      consumedWater += amount;
      remainingWater = dailyWaterGoal - consumedWater;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double circularIndicatorSize = 300.0; // Dairesel gösterge boyutu
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyTabBarIcon(
                  text: 'Water Reminder', image: 'assets/steps/fire.png'),
              CircularPercentIndicator(
                  animation: true,
                  animationDuration: 2000,
                  radius: 150,
                  lineWidth: 30,
                  progressColor: Colors.limeAccent.shade400,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: consumedWater / dailyWaterGoal,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'daily goal: $dailyWaterGoal ml',
                        style: kLabelTextStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Water Consumed Today: $consumedWater ml',
                        style: kLabelTextStyle,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Remaining Water: $remainingWater ml',
                        style: kLabelTextStyle,
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: TextFormField(
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18),
                  controller: valueController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(60)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      fillColor: Theme.of(context).colorScheme.secondary,
                      filled: true,
                      hintText: 'The amount of water you drink (ml)',
                      hintStyle: TextStyle(color: Colors.grey.shade800)),
                  cursorColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              MyButton(
                  onTap: () {
                    int enteredValue = int.tryParse(valueController.text) ?? 0;
                    updateWaterIntake(enteredValue);
                  },
                  text: 'Update',
                  color: Colors.limeAccent[400])
            ],
          ),
        ),
      ),
    );
  }
}
