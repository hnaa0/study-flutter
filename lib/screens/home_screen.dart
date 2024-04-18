import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "dart:async";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMins = 1500;
  int totalSecs = twentyFiveMins;
  int totalPomodoros = 0;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSecs == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSecs = twentyFiveMins;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSecs = totalSecs - 1;
      });
    }
  }

  String format(int secs) {
    var duration = Duration(seconds: secs);
    return duration.toString().split(".").first.substring(2, 7);
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSecs = twentyFiveMins;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Flexible: UI를 비율에 기반해서 더 유연하게 만들 수 있게 해주는 위젯
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSecs),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline_outlined),
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: onResetPressed,
                    iconSize: 50,
                    color: Theme.of(context).cardColor,
                    icon: const Icon(Icons.restart_alt_rounded),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color),
                        ),
                        Text(
                          "$totalPomodoros",
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
