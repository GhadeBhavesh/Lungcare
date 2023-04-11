import 'package:care/screens/Account.dart';
import 'package:care/screens/home.dart';
import 'package:care/screens/sign_in_page.dart';
import 'package:care/screens/welcome_page.dart';
import 'package:flutter/material.dart';




class Navigate {
  static Map<String, Widget Function(BuildContext)> routes =   {
    '/' : (context) => WelcomePage(),
    '/sign-in' : (context) => SignInPage(),
    '/home'  : (context) => HomePage()
  };
}
