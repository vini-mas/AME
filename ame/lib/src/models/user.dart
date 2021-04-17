class User {
  final int id;
  //final String login;
  final String name;
  final String email;

  User(
      this.id,
      //this.login,
      this.name,
      this.email);

  Map toJson() => {
        //'login': login,
      };

  User.fromJson(Map json)
      : id = json['id'],
        //login = json['login'],
        name = json['name'],
        email = json['email'];
}
