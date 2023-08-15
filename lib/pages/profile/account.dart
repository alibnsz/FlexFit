import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../../components/tabBar.dart';
import 'components/textBox.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                  const MyTabBarIcon(
                      text: 'PROFILE', image: 'assets/account/me.png'),
                  Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.grey.shade600,
                  ),
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'My Details',
                      style: kLabelTextStyle,
                    ),
                  ),
                  MyTextBox(
                    text: userData['username'],
                    sectionName: 'username',
                    onPressed: () {},
                  ),
                  MyTextBox(
                    text: userData['firstname'],
                    sectionName: 'firstname',
                    onPressed: () {},
                  ),
                  MyTextBox(
                    text: userData['lastname'],
                    sectionName: 'lastname',
                    onPressed: () {},
                  ),
                  MyTextBox(
                    text: userData['age'].toString(),
                    sectionName: 'age',
                    onPressed: () {},
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
