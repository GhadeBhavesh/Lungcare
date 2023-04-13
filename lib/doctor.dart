import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Doctor_info extends StatefulWidget {
  const Doctor_info({Key? key}) : super(key: key);

  @override
  State<Doctor_info> createState() => _Doctor_infoState();
}

class _Doctor_infoState extends State<Doctor_info> {
  final url = "https://khar.hindujahospital.com/doctor/dr-vijay-m-patil/";
  final url1 = "https://drsureshadvani.in/make-appointment/";
  final url2 = "https://tmc.gov.in/index.php/en/";
  final url3 =
      "https://www.kokilabenhospital.com/professionals/sandeepgoyle.html";
  final url4 = "https://www.mocindia.co.in/our-team/dr-vashistha-maniar";
  final url5 = "https://www.mocindia.co.in/our-team/dr-pritam-alaskar";
  final url6 =
      "https://www.apollo247.com/doctors/dr-rakesh-rattan-jalali-c4948d93-3a09-420c-98c6-ee5fc2b61ed5";
  final url7 = "https://myacare.com/doctor/dr-rajeev-kumar-india";
  final url8 = "https://www.hcgoncology.com/doctors/dr-ramesh-s-bilimagga/";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/Dr. Vijay Patil.jpg")),
                SizedBox(height: 10),
                Text(
                  'Dr. Vijay Patil',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  ' Medical Oncology,Solid Tumor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Hinduja Hospital,Mumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/Dr.suresh_advani.jpg")),
                SizedBox(height: 10),
                Text(
                  'Dr.Suresh Advani',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Medical Oncology',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Jashlok Hospital,Mumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url1);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/Dr.kumar Prabhash.webp")),
                SizedBox(height: 10),
                Text(
                  'Dr.Kumar Prabhash',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Medical Oncology',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Tata Memorial Hospital,Mumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url2);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/Dr.Sandeep Goyle.webp")),
                SizedBox(height: 10),
                Text(
                  'Dr.Sandeep Goyle',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Medical Oncology',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Kokilaben Dhirubhai Ambani Hospital,\nMumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url3);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/dr.Vashistha Maniar.webp")),
                SizedBox(height: 10),
                Text(
                  'Dr.Vashistha Maniar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Medical Oncology',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Mumbai Oncocare Center,Mumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url4);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/Dr. Pritam Kalashar.jpg")),
                SizedBox(height: 10),
                Text(
                  'Dr. Pritam Kalashar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Medical Oncology',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Mumbai Oncocare Center,Mumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url5);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/dr-rakesh-jalali.jpg")),
                SizedBox(height: 10),
                Text(
                  'Dr. Rakesh Jalali',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Medical Oncology',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Apollo Proton Cancer Centre,Mumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url6);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/Dr.Rajeev-Kumar.jpg")),
                SizedBox(height: 10),
                Text(
                  'Dr.Rajeev Kumar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Medical Oncology',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Asian Cancer Instiute ,Mumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url7);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/Dr.Ramesh-Bilimagga.jpg")),
                SizedBox(height: 10),
                Text(
                  'Dr. Ramesh S. Bilimagga',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Medical Oncology',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Global Hospital ,Mumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url8);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
            elevation: 5,
            child: Column(
              children: <Widget>[
                Container(
                    width: 200,
                    height: 150,
                    child: Image.asset("assets/Dr. Amit Joshi .png")),
                SizedBox(height: 10),
                Text(
                  'Dr.Amit Joshi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Medical Oncology',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 14),
                    SizedBox(width: 5),
                    Text(
                      'Tata Memorial Hospital,Mumbai',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    launch(url2);
                  },
                  child: Text("For Appointment"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      )),
    );
    ;
  }
}