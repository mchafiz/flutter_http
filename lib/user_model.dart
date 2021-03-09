import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  String id = '';
  String name = '';
  String email = '';
  String avatar = '';
  String url = '';
  String text = '';
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.url,
    required this.text,
  });

  factory User.createUser(
      Map<String, dynamic> object, Map<String, dynamic> object2) {
    return User(
        id: object['id'].toString(),
        name: object['first_name'] + "" + object['last_name'],
        email: object['email'],
        avatar: object['avatar'],
        url: object2['url'],
        text: object2['text']);
  }
  static Future<User> getApi(String id) async {
    final uri = Uri.parse('https://reqres.in/api/users/' + id);

    var result = await http.get(uri);
    var jsonObject = json.decode(result.body);
    var jsonObject2 = json.decode(result.body);

    var userData = (jsonObject as Map<String, dynamic>)['data'];
    var userData2 = (jsonObject2 as Map<String, dynamic>)['support'];

    return User.createUser(userData, userData2);
  }
}
