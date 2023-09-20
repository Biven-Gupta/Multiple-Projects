class User {
  String? id;
  String? name;
  String? email;

  User({required this.id, required this.name, required this.email});

  // Object to Map
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
    };
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    email = map["email"];
  }
}
