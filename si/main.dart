
import 'package:care/resetpass.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (!snapshot.hasData) return Container();

          final isLoggedIn = snapshot.data!.result= null;
          return isLoggedIn ? FirstScreen(): LoginPage();
        },
    ));
  }
}
class SharedPreferences {
  static Future<SharedPreferences> getInstance() async => SharedPreferences();
  
  // Login
  String? getString(String email) => null;
  
  // Home
//   String getString(String email) => "test@email.com";
}