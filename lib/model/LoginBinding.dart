import 'dart:convert';

class LoginBinding {
  final String username;
  final String password;

  LoginBinding({this.username, this.password});

  factory LoginBinding.fromJson(Map<String, dynamic> json) {
    return LoginBinding(username: json['username'], password: json['password']);
  }

  String toJson() {
    return jsonEncode(<String, String>{
      'username': username,
      'password': password,
    });
  }

  int test(int a, {int num}) => a++;
}
