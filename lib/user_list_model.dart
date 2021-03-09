import 'package:http/http.dart' as http;
import 'dart:convert';

class UserList {
  String id;
  String name;
  UserList({
    required this.id,
    required this.name,
  });

  factory UserList.getApi(Map<String, dynamic> object) {
    return UserList(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<List<UserList>> getUsers(String page) async {
    final uri = Uri.parse('https://reqres.in/api/users?page=' + page);

    var result = await http.get(uri);
    var jsonObject = json.decode(result.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];
    List<UserList> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(UserList.getApi(listUser[i]));
    }
    return users;
  }
}
