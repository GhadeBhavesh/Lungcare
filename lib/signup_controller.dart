import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:care/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();


  final userEmail = TextEditingController();
  final userPass = TextEditingController();
  final userName = TextEditingController();
  final phoneNo = TextEditingController();

  //call this function from Desidn $ it will do the rest
  void registerUser(String userEmail, String userPass , String userName, String phoneNo) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(userEmail, userPass,userName,phoneNo);
  }
  void login(String userEmail, String userPass) async {
    AuthenticationRepository.instance.signInWithEmailAndPassword(userEmail, userPass,);
  }
  void  signInWithGoogle(String userEmail, String userPass) async {
    AuthenticationRepository.instance.signInWithGoogle();
  }
}
