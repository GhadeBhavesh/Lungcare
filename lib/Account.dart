import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:care/login_page.dart';
import 'package:care/space.dart';

import 'package:care/sign_in.dart';


class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}
class _AccountState extends State<Account> {
 
  @override
  Widget build(BuildContext context) {
  User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
     appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: user!.photoURL!= null ?  NetworkImage(user.photoURL!): NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 16,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: user!.photoURL!= null ?  NetworkImage(user.photoURL!): NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 132,
                  child: 
                 Text(user!.email!, style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                  
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Bio:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'I am a software developer.',
            style: TextStyle(fontSize: 16),
          ),
         
         
        ],
      ),
      ),
    );
  }
}

// Padding(
//         padding: EdgeInsets.only(top: 10.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SpaceVH(height: 80.0),
//               Text(
//                 'Welcome Back!',
//                 style: TextStyle(color: Colors.black)
//               ),
//               SpaceVH(height: 30.0),
//               Text(
//                 'Please sign in to your account',
//                 style: headline3,
//               ),
//               SpaceVH(height: 40.0),
//               textFild(
//                 controller: userName,
//                 image: '',
//                 hintTxt: 'Username',
//               ),
//               textFild(
//                 controller: userPass,
//                 image: '',
//                 isObs: true,
//                 hintTxt: 'Password',
//               ),
//               SpaceVH(height: 10.0),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 20.0),
//                   child: TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       'Forgot Password?',
//                       style: headline3,
//                     ),
//                   ),
//                 ),
//               ),
//               SpaceVH(height: 30.0),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Column(
//                   children: [
//                     Mainbutton(
//                       onTap: () {},
//                       text: 'Sign in',
//                       txtColor: Color.fromARGB(255, 242, 238, 239),
//                       btnColor: blueButton,
//                     ),
//                     SpaceVH(height: 20.0),
//                     Mainbutton(
//                       onTap: () {},
//                       text: 'Sign in with google',
//                       image: 'google.png',
//                       btnColor: white,
//                       txtColor: blackBG,
//                     ),
//                     SpaceVH(height: 20.0),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (builder) => SignInPage()));
//                       },
//                       child: RichText(
//                         text: TextSpan(children: [
//                           TextSpan(
//                             text: 'Don\' have an account? ',
//                             style: headline.copyWith(
//                               fontSize: 14.0,
//                             ),
//                           ),
//                           TextSpan(
//                             text: ' Sign Up',
//                             style: headlineDot.copyWith(
//                               fontSize: 14.0,
//                             ),
//                           ),
//                         ]),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),