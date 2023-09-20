class Person {
  String name;
  String email;
  String imageUrl;

  Person({required this.name, required this.email, required this.imageUrl});

  Person.fromJson(Map<String, dynamic> json)
      : name =
            "${json["name"]["title"]} ${json["name"]["first"]} ${json["name"]["last"]}",
        email = json["email"],
        imageUrl = json["picture"]["thumbnail"];
}
