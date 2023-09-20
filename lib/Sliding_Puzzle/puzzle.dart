import 'package:flutter/material.dart';

class SlidingPuzzle extends StatefulWidget {
  const SlidingPuzzle({Key? key}) : super(key: key);

  @override
  State<SlidingPuzzle> createState() => _SlidingPuzzleState();
}

class _SlidingPuzzleState extends State<SlidingPuzzle> {
  int valueSlider = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.green[100],
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  child: const Text(
                    "Sliding Puzzle",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1.5, -1.5),
                            color: Colors.white),
                        Shadow(
                            // bottomRight
                            offset: Offset(1.5, -1.5),
                            color: Colors.white),
                        Shadow(
                            // topRight
                            offset: Offset(1.5, 1.5),
                            color: Colors.white),
                        Shadow(
                            // topLeft
                            offset: Offset(-1.5, 1.5),
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      child: Text('Hello'),
                      color: Colors.red,
                      width: constraints.biggest.width,
                      height: constraints.biggest.width,
                    );
                  },
                ),
              ),
              Container(
                child: Slider(
                  max: 15,
                  min: 2,
                  divisions: 13,
                  label: valueSlider.toString(),
                  value: valueSlider.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      valueSlider = value.toInt();
                    });
                  },
                ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class SlidingPuzzleWidget extends StatefulWidget {
  const SlidingPuzzleWidget({Key? key}) : super(key: key);

  @override
  State<SlidingPuzzleWidget> createState() => _SlidingPuzzleWidgetState();
}

class _SlidingPuzzleWidgetState extends State<SlidingPuzzleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
