


// import 'package:care/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class AuthClass {
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: [
//       'email',
//       'https://www.googleapis.com/auth/contacts.readonly',
//     ],
//   );
//   FirebaseAuth auth = FirebaseAuth.instance;
  
 


//   Future<void> googleSignIn(BuildContext context) async {
//     try {
//       GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;

//         AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken,
//         );

//         try {
//           UserCredential userCredential =
//               await auth.signInWithCredential(credential);

//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (builder) =>  HomePage()),
//               (route) => false);
//         } catch (e) {
//           final snackbar = SnackBar(content: Text(e.toString()));
//           ScaffoldMessenger.of(context).showSnackBar(snackbar);
//         }
//       } else {
//         final snackbar = SnackBar(content: Text("Not Able to sign In "));
//         ScaffoldMessenger.of(context).showSnackBar(snackbar);
//       }
//     } catch (e) {
//       final snackbar = SnackBar(content: Text(e.toString()));
//       ScaffoldMessenger.of(context).showSnackBar(snackbar);
//     }
//   }


//   Future<void> verifyPhoneNumber(
//       String phoneNumber, BuildContext context, Function setData) async {
//     PhoneVerificationCompleted verificationCompleted =
//         (PhoneAuthCredential phoneAuthCredential) async {
//       showSnackBar(context, "Verification Completed");
//     };
//     PhoneVerificationFailed verificationFailed =
//         (FirebaseAuthException exception) {
//       showSnackBar(context, exception.toString());
//     };
//     void Function(String verificationID, [int forceResnedingtoken]) codeSent =
//         (String verificationID, [int? forceResnedingtoken]) {
//       showSnackBar(context, "Verification Code sent on the phone number");
//       setData(verificationID);
//     };
//     PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationID) {
//       showSnackBar(context, "Time out");
//     };
//     try {
//       await auth.verifyPhoneNumber(
//           phoneNumber: phoneNumber,
//           verificationCompleted: verificationCompleted,
//           verificationFailed: verificationFailed,
//           codeAutoRetrievalTimeout: codeAutoRetrievalTimeout, codeSent: code);
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

//   Future<void> logout() async {
//     try {
//       await _googleSignIn.signOut();
//       await auth.signOut();
//     } catch (e) {
//     }
//   }

//   Future<void> signInwithPhoneNumber(
//       String verificationId, smsCode, BuildContext context) async {
//     try {
//       AuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: verificationId, smsCode: smsCode);
//       UserCredential userCredential =
//           await auth.signInWithCredential(credential);
     
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (builder) =>  HomePage(id: '',)),
//           (route) => false);
//       showSnackBar(context, "logged Ind");
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }

//   void showSnackBar(BuildContext context, String text) {
//     final snackbar = SnackBar(content: Text(text.toString()));
//     ScaffoldMessenger.of(context).showSnackBar(snackbar);
//   }
// }
// // import 'package:care/main.dart';
// // import 'package:care/screens/home.dart';
// // import 'package:care/screens/welcome_page.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class FirebaseService {
// //   static FirebaseService get instance => Get.find();
// //    final _auth = FirebaseAuth.instance;
// //   late final Rx<User?> firebaseUser;
  

// //   void onReady() {
// //     firebaseUser = Rx<User?>(_auth.currentUser);
// //     firebaseUser.bindStream(_auth.userChanges());
// //     ever(firebaseUser, _setInitialScreen);
// //   }

// //   _setInitialScreen(User? user) {
// //     user == null
// //         ? Get.offAll(() =>  WelcomePage())
// //         : Get.offAll(() => const HomePage());
// //   }

// //   Future<void> createUserWithEmailAndPassword(
// //       String userEmail, String userPass, String userName, String phoneNo) async {
// //     try {
// //       await _auth.createUserWithEmailAndPassword(
// //           email: userEmail, password: userPass,);
// //       firebaseUser.value != null
// //           ? Get.offAll(() => const HomePage())
// //           : Get.to(() =>  WelcomePage());
          
// //     } on FirebaseAuthException catch (e) {
// //     Get.snackbar("About user", "User message",
    
// //     backgroundColor: Colors.pink,
// //     snackPosition: SnackPosition.BOTTOM,
// //     titleText: Text("Account creation failed",
// //     style: TextStyle(
// //       color: Colors.white 
// //     ),),
// //     messageText: Text(
// //       e.toString(),
// //       style: TextStyle(
// //         color: Colors.white
// //       ),
// //     )
// //     );
// //     }
// //   }
// //    Future<void> signInWithEmailAndPassword(
// //       String userEmail, String userPass, ) async {
// //     try {
// //       await _auth.signInWithEmailAndPassword(
// //           email: userEmail, password: userPass);
    
// //     }  on FirebaseAuthException catch (e) {
// //        Get.snackbar("About Login", "Login message",
    
// //     backgroundColor: Colors.pink,
// //     snackPosition: SnackPosition.BOTTOM,
// //     titleText: Text("Login failed",
// //     style: TextStyle(
// //       color: Colors.white 
// //     ),),
// //     messageText: Text(
// //       e.toString(),
// //       style: TextStyle(
// //         color: Colors.white
// //       ),
// //     )
// //     );
// //     }
// //       }
 
// //   final GoogleSignIn _googleSignIn = GoogleSignIn();
// //   Future<String?> signInwithGoogle() async {
// //     try {
// //       final GoogleSignInAccount? googleSignInAccount =
// //           await _googleSignIn.signIn();
// //       final GoogleSignInAuthentication googleSignInAuthentication =
// //           await googleSignInAccount!.authentication;
// //       final AuthCredential credential = GoogleAuthProvider.credential(
// //         accessToken: googleSignInAuthentication.accessToken,
// //         idToken: googleSignInAuthentication.idToken,
// //       );
// //         firebaseUser.value != null
// //           ? Get.offAll(() => const HomePage())
// //           : Get.to(() =>  WelcomePage());
// //       await _auth.signInWithCredential(credential);
// //     } on FirebaseAuthException catch (e) {
// //       print(e.message);
// //       throw e;
// //     }
// //   }

// //   Future<void> signOutFromGoogle() async{
// //     await _googleSignIn.signOut();
// //     await _auth.signOut();
// //   }
// // }
  