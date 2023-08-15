import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../bmi/calculator_page.dart';
import '../fitness/fitness_page.dart';
import '../profile/account.dart';
import '../statistics/statistics.dart';
import 'components/drawer.dart';
import 'components/home_tile.dart';
import 'components/tabBar.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const MyTabBar(),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/account/me.png',
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ));
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              MyCards(
                backgroundImage: 'assets/fitness/intro.jpg',
                icon: 'assets/steps/running.png',
                title: randomStep().toString(),
                subtitle: 'Steps',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Statistics(),
                  ));
                },
              ),
              const SizedBox(height: 30),
              MyCards(
                backgroundImage: 'assets/fitness/spor.jpg',
                icon: 'assets/tabbar/gym.png',
                title: 'Training',
                subtitle: 'you will be the best',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FitPage(),
                  ));
                },
              ),
              const SizedBox(height: 30),
              MyCards(
                backgroundImage: 'assets/fitness/fitgirl.jpg',
                icon: 'assets/fitness/bmi.png',
                title: 'B M I',
                subtitle: 'CALCULATE',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CalculatorScreen(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
