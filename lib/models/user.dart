class User {
  String name;
  String password;

  User(
    String name,
    String password,
  ) {
    this.name = name;
    this.password = password;
  }

  User.fromJson(dynamic json)
      : name = json['name'] as String,
        password = json['password'] as String;

  dynamic toJson() {
    return {
      'name': name,
      'password': password,
    };
  }
}
