import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Stopwatch stopwatch = Stopwatch();

  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormated() {
    var milli = stopwatch.elapsed.inMilliseconds;

    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = (((milli ~/ 1000) ~/ 60) % 60).toString().padLeft(2, "0");
    String hours = ((milli ~/ 1000) ~/ 3600).toString().padLeft(2, "0");
    return "$hours:$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    Timer t = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.pink,
        title: const Text(
          'STOPWATCH',
          style: TextStyle(
            color: Colors.pink,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
                child: Container(
                  alignment: Alignment.center,
                  height: 300,
                  child: Text(
                    returnFormated(),
                    style: const TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.lightBlueAccent,
                      width: 5,
                    ),
                  ),
                ),
                onPressed: () {
                  handleStartStop();
                }),
            const SizedBox(height: 10),
            CupertinoButton(
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  stopwatch.reset();
                }),
          ],
        ),
      ),
    );
  }
}
