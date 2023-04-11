
// import 'package:care/services/firebase_service.dart';
// import 'package:care/sign_up.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp( MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({ Key? key}) : super(key: key);
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Widget currentPage = const SignUpPage();
//   AuthClass authClass = AuthClass();
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SignUpPage(),
//     );
//   }
// }






// // import 'package:care/firebase_options.dart';
// // import 'package:care/screens/authentication_repository.dart';
// // import 'package:care/screens/home.dart';
// // import 'package:care/screens/welcome_page.dart';
// // import 'package:care/services/firebase_service.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'navigation/navigate.dart';
// // import 'utils/constants.dart';

// // Future main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Future.delayed(Duration(seconds: 1));
// //   Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
// //       .then((value) => Get.put(AuthenticationRepository()));
// //   final prefs = await SharedPreferences.getInstance();
// //   final showHome = prefs.getBool("showHome") ?? false;
// //   runApp(MyApp(showHome: showHome));
// // }
 
// // // Future initialization(BuildContext? context) async {
// // //   await Future.delayed(Duration(seconds: 2));
// // // }

// // class MyApp extends StatelessWidget {
// //   final bool showHome;
// //   MyApp({
// //     Key? key,
// //     required this.showHome,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return GetMaterialApp(
// //       title: 'lungCare',
// //       debugShowCheckedModeBanner: false,
// //       home: showHome ? WelcomePage() : HomePage(),
// //     );
// //   }
// // }
