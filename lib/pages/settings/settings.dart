import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../../components/tabBar.dart';
import 'components/notification_button.dart';
import 'components/textBox.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyTabBarIcon(
                  text: 'S E T T I N G S',
                  image: 'assets/account/settings.png'),
              Icon(
                Icons.settings,
                size: 70,
                color: Colors.grey.shade600,
              ),
              const SizedBox(height: 20),
              const Text(
                'Details',
                style: kLabelTextStyle,
              ),
              SettingsTextBox(
                text: 'English',
                sectionName: 'Language',
                onPressed: () {},
              ),
              SettingsTextBox(
                text: 'Türkiye',
                sectionName: 'country',
                onPressed: () {},
              ),
              SettingsTextBox(
                text: 'Metric',
                sectionName: 'measurement unit',
                onPressed: () {},
              ),
              const NotificationButton(text: 'Stop All Notifications'),
              const NotificationButton(text: 'Update Notifications'),
              const NotificationButton(text: 'Update Notifications'),
              const NotificationButton(text: 'Update Notifications'),
            ],
          ),
        ),
      ),
    );
  }
}
