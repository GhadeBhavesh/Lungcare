import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';


import 'ogin.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(), initialRoute: '/', routes: {
      'homepage': (context) => HomePage(),
      'login': (context) => Login(),
    });
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
// String name=uid.name;
    DatabaseReference dbRef =
        FirebaseDatabase.instance.reference().child('users');
    return FutureBuilder(

        future: dbRef.child(uid).child('name').once(),
        builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData) {
         
            return Scaffold(
              appBar: AppBar(
                
                title: TextButton.icon(
                  onPressed: () {
                    _signOut(context);
                  },
                  label: Text('signout',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white70,
                  ),
                ),
                backgroundColor: Colors.lightBlue[900],
              ),
              body: Center(
                child: Text(
                  'Welcome\n  ' ,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return Scaffold(
            backgroundColor: Colors.blueGrey[800],
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          );
        });
  }
}

Future<void> _signOut(BuildContext context) async {
  // FirebaseAuth.instance.currentUsper.delete();
  await FirebaseAuth.instance.signOut();
  Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => Login()));
}