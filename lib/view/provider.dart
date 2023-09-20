import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_provider/states/app_state.dart';
import 'package:provider/provider.dart';

class ProviderPractice extends StatelessWidget {
  const ProviderPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Provider',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<AppState>(builder: (context, provider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: Text(
                      '${provider.start}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                          colors: [Colors.indigo, Colors.pink, Colors.blue]),
                      border: Border.all(
                        color: Colors.indigo,
                        width: 5,
                      ),
                    ),
                  ),
                  onPressed: () {
                    provider.updateStart(100);
                    provider.getTimer();
                  }),
              const SizedBox(height: 10),
              CupertinoButton(
                  child: const Text(
                    'Click',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {}),
            ],
          );
        }),
      ),
    );
  }
}
