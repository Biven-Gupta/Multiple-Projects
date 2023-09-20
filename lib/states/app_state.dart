import 'dart:async';

import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int temp = 110;

  void update(int temp) {
    this.temp = temp;
    notifyListeners();
  }

  //Timer Function
  int start = 0;

  void updateStart(int start) {
    this.start = start;
    notifyListeners();
  }

  void getTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateStart(timer.tick);
    });
  }

  String name = 'Qwerty';

  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }

  Future<void> getName(String name) async {
    Future.delayed(Duration(seconds: 5), () {
      updateName(name);
    });
  }
}
