class User {
  final String login;
  final String name;

  User(this.login, this.name);

  Map toJson() => {
        'login': login,
      };

  User.fromJson(Map json)
      : login = json['login'],
        name = json['name'];
}
