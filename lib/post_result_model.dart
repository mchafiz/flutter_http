import 'package:http/http.dart' as http;
import 'dart:convert';

class PostResult {
  PostResult(
      {required this.id,
      required this.name,
      required this.job,
      required this.createdAt});

  factory PostResult.createPostResult(Map<String, dynamic> json) {
    return PostResult(
        id: json['id'],
        name: json['name'],
        job: json['job'],
        createdAt: json['createdAt']);
  }

  String createdAt = '';
  String id = '';
  String job = '';
  String name = '';

  //factory method fungsi untuk membuat object dari postresult membuat object nya itu dari hasil maping json object
  factory PostResult.create(Map<String, dynamic> json) {
    return PostResult(
        id: json['id'],
        name: json['name'],
        job: json['job'],
        createdAt: json['createdAt']);
  }

  //method untuk menghubungkan aplikasi kita ke API
  static Future<PostResult> connectToApi(String name, String job) async {
    final uri = Uri.parse('https://reqres.in/api/users');

    var result = await http.post(uri, body: {"name": name, "job": job});
    var jsonObject = json.decode(result.body);

    return PostResult.create(jsonObject);
  }
}
