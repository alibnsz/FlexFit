import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../../components/graph/graph_bar.dart';
import '../../components/tabBar.dart';
import 'components/long_containers.dart';
import 'components/short_containers.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MyTabBarIcon(
                    text: 'STATISTICS', image: 'assets/steps/running.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        LongContainer(
                          title: 'Total Steps',
                          image: 'assets/steps/running.png',
                          numbers: '${randomStep()}',
                          subtitle: 'Step',
                          color: const Color.fromARGB(255, 249, 255, 164),
                          title2: 'Total Distance',
                          image2: 'assets/steps/distance.png',
                          numbers2: '3.4',
                          subtitle2: 'kilometer',
                        ),
                        const SizedBox(height: 2),
                        const ShortContainer(
                          color: Color.fromARGB(255, 255, 174, 136),
                          image: 'assets/steps/littlewater.png',
                          title: 'Water',
                          numbers: '1200 ',
                          subtitle: 'ml',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const ShortContainer(
                          image: 'assets/steps/moon.png',
                          title: 'Sleep Time',
                          subtitle: 'hours',
                          numbers: '23:09',
                          color: Color.fromARGB(255, 212, 173, 248),
                        ),
                        const SizedBox(height: 2),
                        LongContainer(
                          title: 'Calories',
                          image: 'assets/steps/fire.png',
                          numbers: '${randomKcal()}',
                          subtitle: 'kcal',
                          title2: 'Heart Rate',
                          image2: 'assets/steps/heart.png',
                          numbers2: '${randomBpm()}',
                          subtitle2: 'Bpm',
                          color: const Color.fromARGB(255, 180, 255, 173),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const BarGraph(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
