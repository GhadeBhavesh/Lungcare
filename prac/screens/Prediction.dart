import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Predict extends StatefulWidget {
  @override
  _PredictState createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  File? file;
  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
             SizedBox(height: 80,),
            Container(
              height: 240,
              width:250,
              color: Colors.black12,
              child: file == null
                  ? Icon(
                      Icons.image,
                      size: 120,
                    )
                  : Image.file(
                      file!,
                      fit: BoxFit.fill,
                    ),
            ),
            SizedBox(height: 80,),
                GestureDetector(
              onTap: () {
                  getgall();
   },
          child:  Container(
            height: 30,
            width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  Color.fromARGB(255, 227, 14, 53)
              ), 
                child: Center(
                  child: Text(
                    "Take from Gallery",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),),
             SizedBox(height: 20,),
             GestureDetector(
              onTap: () {
                  getcam();
   },
          child:  Container(
            height: 30,
            width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  Color.fromARGB(255, 227, 14, 53)
              ), 
                child: Center(
                  child: Text(
                    "Take from Camera",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),)
          ],
        ),
      ),
    );
  }

  getcam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getgall() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }
}