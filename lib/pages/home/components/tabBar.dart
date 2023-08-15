import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/constants.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> editField(String filed) async {}

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          final userData = snapshot.data!.data() as Map<String, dynamic>?;

          String firstName = '';
          String lastName = '';

          if (currentUser.providerData
              .any((info) => info.providerId == 'google.com')) {
            // Google ile giriş yapılmışsa displayName kullanılıyor
            firstName = userData?['displayName'] ?? '';
          } else {
            // Google ile giriş yapılmamışsa firstname ve lastname kullanılıyor
            firstName = userData?['firstname'] ?? '';
            lastName = userData?['lastname'] ?? '';
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome back,',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        children: [
                          Text(
                            firstName,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 20,
                              fontFamily: 'Bungee',
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            lastName,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 20,
                              fontFamily: 'Bungee',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
