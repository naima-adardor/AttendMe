class User {
  int? id;
  String? first_name;
  String? last_name;
  String? email;
  String? avatar;
  String? phone_number;
  String? cin;
  String? adress;
  String? token;
  String? birthday;

  User({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
    this.phone_number,
    this.birthday,
    this.cin,
    this.adress,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      email: json['user']['email'],
      first_name: json['user']['first_name'],
      last_name: json['user']['last_name'],
      avatar: json['user']['avatar'],
      phone_number: json['user']['phone_number'],
      birthday: json['user']['birthday'],
      cin: json['user']['cin'],
      adress: json['user']['adress'],
      token: json['token'],
    );
  }
}
