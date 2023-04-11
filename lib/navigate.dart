import 'package:care/home.dart';
import 'package:care/sign_in.dart';
import 'package:care/we.dart';
import 'package:flutter/material.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => Wellcome(),
    '/sign-in': (context) => SignInPage(),
    '/home': (context) => HomePage()
  };
}
