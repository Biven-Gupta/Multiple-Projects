import 'dart:convert';

import 'package:flutter/material.dart';

import 'model.dart';

class SnD extends StatefulWidget {
  const SnD({Key? key}) : super(key: key);

  @override
  State<SnD> createState() => _SnDState();
}

class _SnDState extends State<SnD> {
  User obj = User(
      id: '001', name: 'Biven Gupta', email: 'biven@orientaloutsorcing.com');
  String jsonUser =
      '{"id":"001","name":"Biven Gupta","email":"biven@orientaloutsorcing.com"}';
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
                  Map<String, dynamic> map = obj.toMap();
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
                  Map<String, dynamic> map = decode;
                  User user = User.fromMap(map);
                  //print(user.name.toString());
                  print(user.name.toString());
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
