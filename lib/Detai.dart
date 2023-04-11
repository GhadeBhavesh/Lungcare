import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:care/Account.dart';
import 'package:care/Prediction.dart';
import 'package:care/authentication_repository.dart';

import 'package:care/home.dart';


class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var _currentIndex;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("LungCare"),
        actions: [
          IconButton(
              onPressed: () {
                AuthenticationRepository.instance.signOutGoogle();
              },
              icon: Icon(Icons.logout_outlined))
        ],
        leading: Icon(Icons.health_and_safety),
        elevation: 10,
        backgroundColor: Colors.pink,
      ),
      body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex == 2);
          },
          children: [
            Column(children: [
              SizedBox(height: 40),
              Image.asset(
                "assets/hu4.png",
                height: 120,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '"We are going to detect cancer cells early and want to make India cancer free"',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Lung cancer is a type of cancer that begins in the lungs.Your lungs are two spongy organs in your chest that take in oxygen.Lung cancer is the leading cause of cancer deaths worldwide.Your lungs are two spongy organs in your chest that take in oxygen.Lung cancer is the leading cause of cancer deaths worldwide.',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  height: 59,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => _pageController.jumpToPage(2),
                    child: const Text("Start Predict"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                  )),
            ]),
          ]),
    );
  }
}
