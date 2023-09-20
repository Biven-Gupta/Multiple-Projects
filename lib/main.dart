import 'package:flutter/material.dart';
import 'package:practice_provider/states/app_state.dart';
import 'package:provider/provider.dart';

import 'Networing&Http/screen/home.dart';

/*void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SlidingPuzzle(),
  ));
}*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: StopWatch(),
        //home: ProviderPractice(),
        home: HomeScreen(),

        /// Manual
        //home: SnD(),

        /// Automatic
        //home: Screen(),
        //home: SnDauto(),
      ),
    );
  }
}
