
import 'package:care/sign.dart';
import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                },
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class Wellcome extends StatelessWidget {
//   const Wellcome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 140,
//               ),
//               Text(
//                 "Welcome",
//                 style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.pink,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "We are here for you",
//                 style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.pink,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Image(image: AssetImage("assets/hu3.png"), height: 250),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: 200,
//                 height: 35,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Navigator.push(context,
//                     //     MaterialPageRoute(builder: (context) => login_page()));
//                   },
//                   child: Text("Login"),
//                   style: ElevatedButton.styleFrom(
//                       elevation: 10,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30)),
//                       primary: Colors.pink),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: 200,
//                 height: 35,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (context) => SignInPage()));
//                     },
//                     child: Text("Sign In"),
//                     style: ElevatedButton.styleFrom(
//                         elevation: 10,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         primary: Colors.pink)),
//               ),
//             ],
//           ),
//         ),
//       );
//   }
// }
