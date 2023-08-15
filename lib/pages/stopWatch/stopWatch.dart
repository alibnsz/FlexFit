import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../components/constants.dart';
import 'components.dart';

class Watch extends StatefulWidget {
  const Watch({Key? key}) : super(key: key);

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;
  List<String> lapTimes = [];

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Text(
              'STOPWATCH',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 30,
                fontFamily: 'BrunoAce',
                fontWeight: FontWeight.bold,
              ),
            ),
            Stack(children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 45, right: 45, top: 50, bottom: 70),
                height: 300,
                width: 300,
                decoration: watchBox(),
              ),
              Positioned(
                bottom: 200,
                right: 50,
                child: Image.asset(
                  'assets/steps/womans.png',
                  height: 250,
                ),
              ),
              Positioned(
                top: 210,
                left: 100,
                child: StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context, snapshot) {
                    final value = snapshot.data;
                    final displayTime =
                        StopWatchTimer.getDisplayTime(value!, hours: _isHours);
                    return Text(displayTime,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: 'BebasNeue',
                            fontSize: 50));
                  },
                ),
              ),
            ]),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyWatchButton(
                  image: 'assets/steps/play.png',
                  onTap: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  },
                ),
                MyWatchButton(
                  onTap: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                  },
                  image: 'assets/steps/stop.png',
                ),
                MyWatchButton(
                  onTap: () {
                    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                    lapTimes.clear();
                    setState(() {});
                  },
                  image: 'assets/steps/refresh.png',
                ),
                MyWatchButton(
                  onTap: () {
                    final currentTime = _stopWatchTimer.rawTime.value;
                    final displayTime = StopWatchTimer.getDisplayTime(
                        currentTime,
                        hours: _isHours);
                    lapTimes.add(displayTime);
                    setState(() {});
                  },
                  image: 'assets/steps/stopwatch.png',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: const [
                  Text('Laps', style: kLabelTextStyle),
                ],
              ),
            ),
            Column(
              children: lapTimes
                  .asMap()
                  .entries
                  .map((entry) => Container(
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        width: 330,
                        decoration: lapbox(),
                        child: Center(
                          child: Text(
                            'Lap ${entry.key + 1}: ${entry.value}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'BebasNeue',
                                color: Colors.black),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ]),
        ),
      ),
    );
  }

  BoxDecoration watchBox() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(250),
      color: Theme.of(context).colorScheme.secondary,
      boxShadow: [
        const BoxShadow(
          color: Colors.limeAccent,
          offset: Offset(5, 5),
          blurRadius: 60,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Colors.limeAccent.shade400,
          offset: const Offset(-5, -5),
          blurRadius: 60,
          spreadRadius: 0,
        ),
      ],
    );
  }

  BoxDecoration lapbox() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.limeAccent.shade400,
    );
  }
}
