import 'package:flutter/material.dart';

import '../../components/constants.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String title;

  final String details;
  final int index;
  DetailsPage(
      {required this.imagePath,
      required this.title,
      required this.details,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(children: [
        Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'logo$index',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'BebasNeue'),
                        ),
                        Text(details, style: kLabelTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 30,
          left: 10,
          child: Row(children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 25,
                  color: Colors.white,
                )),
            const Text(
              'Back',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BebasNeue'),
            ),
          ]),
        ),
      ]),
    );
  }
}
