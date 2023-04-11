import 'package:care/screens/home.dart';
import 'package:care/screens/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomePage())
        : Get.offAll(() => const HomePage());
  }

  Future<void> createUserWithEmailAndPassword(
      String userEmail, String userPass, String userName, String phoneNo) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPass,);
      firebaseUser.value != null
          ? Get.offAll(() => const HomePage())
          : Get.to(() => const WelcomePage());
          
    } on FirebaseAuthException catch (e) {
    Get.snackbar("About user", "User message",
    
    backgroundColor: Colors.pink,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text("Account creation failed",
    style: TextStyle(
      color: Colors.white 
    ),),
    messageText: Text(
      e.toString(),
      style: TextStyle(
        color: Colors.white
      ),
    )
    );
    }
  }
   Future<void> signInWithEmailAndPassword(
      String userEmail, String userPass, ) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPass);
    
    }  on FirebaseAuthException catch (e) {
       Get.snackbar("About Login", "Login message",
    
    backgroundColor: Colors.pink,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text("Login failed",
    style: TextStyle(
      color: Colors.white 
    ),),
    messageText: Text(
      e.toString(),
      style: TextStyle(
        color: Colors.white
      ),
    )
    );
    }
      }

 Future<void> GoogleSign() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
 Future<void> logout() async => await _auth.signOut();
}
 
//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
