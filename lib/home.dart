import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:care/Account.dart';
import 'package:care/Detai.dart';
import 'package:care/Prediction.dart';
import 'package:care/doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List<Widget> _pages = [Detail(), Doctor_info(), Predict(), Account()];
  var primary = Color.fromARGB(255, 227, 14, 53);
  int _currentIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: _pages),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text('Home'),
                icon: Icon(Icons.home)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text('Doctor'),
                icon: Icon(Icons.medical_services_rounded)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text('Predection'),
                icon: Icon(Icons.event_note_rounded)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text('Account'),
                icon: Icon(Icons.manage_accounts_rounded)),
          ],
        ),
      ),
    );
  }
}
