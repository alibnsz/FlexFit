import 'package:flutter/material.dart';
import '../pages/home/home.dart';
import '../pages/nutrition/nutrition.dart';
import '../pages/stopWatch/stopWatch.dart';
import '../pages/toDo/toDo_page.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
              });
            },
            children: [
              const MyHomePage(),
              Nutrition(),
              const ToDoPage(),
              const Watch(),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipOval(
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                          });
                          _controller.jumpToPage(0);
                        },
                        icon: Image.asset(
                          "assets/exerciseNavBar/home.png",
                          height: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                          });
                          _controller.jumpToPage(1);
                        },
                        icon: Image.asset(
                          "assets/exerciseNavBar/Calories.png",
                          height: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                          });
                          _controller.jumpToPage(2);
                        },
                        icon: Image.asset(
                          "assets/exerciseNavBar/hamburger.png",
                          height: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                          });
                          _controller.jumpToPage(3);
                        },
                        icon: Image.asset(
                          "assets/exerciseNavBar/stopwatch.png",
                          height: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
