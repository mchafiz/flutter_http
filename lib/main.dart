import 'package:flutter/material.dart';
import 'package:http_flutter/post_result_model.dart';
import 'package:http_flutter/user_list_model.dart';
import 'package:http_flutter/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PostResult postResult = PostResult(id: '', name: '', job: '', createdAt: '');
  User userResult =
      User(id: '', name: '', avatar: '', email: '', text: '', url: '');
  String outputList = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'GET POST TO API https://reqres.in/',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.apply(color: Colors.red),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('HASIL POST'),
                      Text(postResult.id),
                      Text(postResult.name),
                      Text(postResult.job),
                      Text(postResult.createdAt),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('HASIL GET USER'),
                      Text(userResult.id.toString()),
                      Text(userResult.name),
                      Text(userResult.email),
                      Text(userResult.text),
                      Text(userResult.url),
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.network(userResult.avatar, scale: 2.0),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('HASIL LIST GET'),
                      Text(outputList),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    PostResult.connectToApi("George", "leader").then((value) {
                      setState(() {
                        postResult = value;
                      });
                    });
                  },
                  child: Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () {
                    User.getApi('11').then((value) {
                      setState(() {
                        userResult = value;
                      });
                    });
                  },
                  child: Text('GET SINGLE USER'),
                ),
                ElevatedButton(
                  onPressed: () {
                    UserList.getUsers('2').then((value) {
                      for (int i = 0; i < value.length; i++) {
                        setState(() {
                          outputList = outputList + "[ " + value[i].name + " ]";
                        });
                      }
                    });
                  },
                  child: Text('GET LIST USER'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
