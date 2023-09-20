import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practice_provider/Json%20Serialize%20&%20Deserialize/Automatic/model_auto.dart';

const String randomPersonURL = "https://randomuser.me/api/";

class PersonNetworkServiceA {
  Future<List<UserA>> fetchPersons(int amount) async {
    http.Response response =
        await http.get(Uri.parse("${randomPersonURL}?results=${amount}"));

    if (response.statusCode == 200) {
      Map<String, dynamic> peopleData = jsonDecode(response.body);
      List<dynamic> peoples = peopleData["results"];
      print('qwerty');
      return peoples.map((json) => UserA.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}
