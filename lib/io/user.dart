class User {
  String name, email, token;
  int id;

  User({this.name, this.email, this.token, this.id});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      token: data["token"]
    );
  }
}
