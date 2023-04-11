import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.purple],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://www.example.com/profile_image.png'),
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            child: Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 20,
            child: Text(
              'UI/UX Designer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on)),
                      Tab(icon: Icon(Icons.photo_library)),
                      Tab(icon: Icon(Icons.people)),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        GridView.count(
                          crossAxisCount: 3,
                          children: List.generate(
                            9,
                            (index) => Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        ListView(
                          children: List.generate(
                            10,
                            (index) => Container(
                              margin: EdgeInsets.all(8),
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        ListView(
                          children: List.generate(
                            5,
                            (index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://www.example.com/profile_image.png'),
                              ),
                              title: Text('Friend ${index + 1}'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}