import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexfit/pages/login/components/my_login_button.dart';
import 'package:flutter/material.dart';
import '../../components/constants.dart';
import '../../components/tabBar.dart';
import 'components/icons.dart';
import 'components/my_textform.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _suggestionController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _suggestionController.dispose();

    super.dispose();
  }

  Future<void> sendFeedback() async {
    addUserDetails(
      _usernameController.text.trim(),
      _emailController.text.trim(),
      _suggestionController.text.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Feedback sent!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> addUserDetails(
    String username,
    String email,
    String suggestion,
  ) async {
    await FirebaseFirestore.instance.collection('feedback').add({
      'username': username,
      'email': email,
      'suggestion': suggestion,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const MyTabBarIcon(
                text: 'FEEDBACK',
                image: 'assets/account/help.png',
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/account/feedback.png',
                height: 100,
                color: Colors.grey.shade500,
              ),
              const SizedBox(height: 40),
              const Text(
                'Shape our app with your valuable feedback',
                style: kLabelTextStyle,
              ),
              const SizedBox(height: 25),
              MyTextForm(
                controller: _usernameController,
                hintText: 'Username',
              ),
              const SizedBox(height: 16.0),
              MyTextForm(
                controller: _emailController,
                hintText: 'mail',
              ),
              const SizedBox(height: 16.0),
              MyTextForm(
                controller: _suggestionController,
                hintText: 'suggestion',
              ),
              const SizedBox(height: 16.0),
              MyButton(
                onTap: sendFeedback,
                text: 'send feedback',
                color: Colors.limeAccent[400],
              ),
              const SizedBox(height: 50),
              IconScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
