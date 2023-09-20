import 'package:json_annotation/json_annotation.dart';

part 'model_auto.g.dart';

@JsonSerializable()
class UserA {
  String name;
  String email;
  String imageUrl;

  UserA({required this.name, required this.email, required this.imageUrl});

  // FromJson
  factory UserA.fromJson(Map<String, dynamic> map) => _$UserAFromJson(map);

  // ToJson
  Map<String, dynamic> toJson() => _$UserAToJson(this);
}
