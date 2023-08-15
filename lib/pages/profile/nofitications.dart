import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../components/constants.dart';
import '../../components/tabBar.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            const MyTabBarIcon(
                text: 'NOTIFICATIONS',
                image: 'assets/account/notification.png'),
            const SizedBox(height: 150),
            LottieBuilder.network(
              'https://assets4.lottiefiles.com/packages/lf20_0xxka1td.json',
              height: 250,
            ),
            const Text(
              'nothing to see here',
              style: kLabelTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
