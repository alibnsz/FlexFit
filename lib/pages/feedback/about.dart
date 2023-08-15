import 'package:flutter/material.dart';


import '../../components/constants.dart';
import '../../components/tabBar.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: const [
                  MyTabBarIcon(text: 'ABOUT', image: 'assets/account/help.png'),
                  Text(
                    "Welcome to FlexFit! We're thrilled to have you on board. Here's some information about our app:\n\n"
                    "About FlexFit:\n"
                    "FlexFit is a Health & Exercise app designed to assist you in leading a healthier and more active lifestyle. We strongly believe that taking care of your physical and mental well-being is essential for overall happiness and quality of life. Our app provides a comprehensive platform with a variety of features to support your health and fitness goals.\n\n"
                    "Key Features:\n\n"
                    "- Personalized Exercise Plans: Our app offers customized exercise plans tailored to your specific needs and goals. Whether you're a beginner or an advanced fitness enthusiast, we have workouts suitable for all fitness levels.\n\n"
                    "- Workout Tracking: Keep track of your progress by logging your workouts and monitoring your achievements. You can record the duration, intensity, and type of exercise, enabling you to analyze your performance over time.\n\n"
                    "- Nutrition Guidance: We understand the importance of a balanced diet in maintaining a healthy lifestyle. Our app provides nutrition guidance, including meal plans and recipes, to help you make informed choices and sustain a healthy eating pattern.\n\n"
                    "- Health Metrics Monitoring: Stay informed about your health by tracking various metrics, such as steps taken, calories burned, and heart rate. This feature allows you to monitor your progress and make adjustments to your routine accordingly.\n\n"
                    "We hope that our Health & Exercise app will become your trusted tool for maintaining a healthy lifestyle. Remember, small steps every day can lead to significant improvements in your overall well-being. Let's embark on this journey together!\n\n"
                    "Please note that while our app is designed to support your health and fitness goals, it's always advisable to consult with a healthcare professional before starting any new exercise or diet regimen.",
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
