import 'dart:convert';

import 'package:flutter/material.dart';

import 'model_auto.dart';

// Optional Screen for Automatic
class SnDauto extends StatefulWidget {
  const SnDauto({Key? key}) : super(key: key);

  @override
  State<SnDauto> createState() => _SnDautoState();
}

class _SnDautoState extends State<SnDauto> {
  UserA obj = UserA(
      imageUrl: '001',
      name: 'Biven Gupta',
      email: 'biven@orientaloutsorcing.com');
  String jsonUser =
      '{"name":"Biven","email":"biven@orientaloutsorcing.com","imageUrl":"01234501"}';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Serialization
                  Map<String, dynamic> map = obj.toJson();
                  var json = jsonEncode(map);
                  print(json);
                },
                child: const Text('Serialize'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Deserialization
                  var decode = jsonDecode(jsonUser);
                  Map<String, dynamic> mapd = decode;
                  obj = UserA.fromJson(mapd);
                  print(obj.name.toString());
                },
                child: const Text('De-Serialize'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
