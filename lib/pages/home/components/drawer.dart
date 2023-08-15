import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../feedback/feedback.dart';
import '../../profile/profile_menu_page.dart';
import '../../waterReminder/water_page.dart';
import 'my_list_tile.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(children: [
        DrawerHeader(
          child: Image.asset(
            'assets/login/logo.png',
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        MyListTile(
          icon: Icons.home,
          text: 'H O M E',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        MyListTile(
          icon: Icons.settings,
          text: 'S E T T I N G S',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfileMenu(),
            ));
          },
        ),
        MyListTile(
          icon: Icons.water_drop,
          text: 'W A T E R  R E M I N D E R',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WaterReminderScreen(),
            ));
          },
        ),
        MyListTile(
          icon: FontAwesomeIcons.comments,
          text: 'F E E D B A C K',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FeedbackScreen(),
            ));
          },
        ),
        MyListTile(
          icon: Icons.exit_to_app,
          text: 'L O G  O U T',
          onTap: () {
            FirebaseAuth.instance.signOut();
            GoogleSignIn().signOut();
          },
        ),
      ]),
    );
  }
}
