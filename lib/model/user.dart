class User {
  String name;
  int age;
  List nicknames;
  User({required this.name, required this.age, required this.nicknames});

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
      name: json!['name'],
      age: json['age'],
      nicknames: List<String>.from(json['nicknames']) as List,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'nicknames': nicknames,
  };
}
