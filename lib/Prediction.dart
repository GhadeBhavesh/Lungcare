import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Predict extends StatefulWidget {
  const Predict({super.key});

  @override
  _PredictState createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  bool _loading = false;
  File? file;
  List? _output;
  ImagePicker image = ImagePicker();
  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
  }

  getcam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
    detectImage(file!);
  }

  getgall() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
    detectImage(file!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prediction"),
        backgroundColor: Colors.pink,
        leading: const Icon(Icons.health_and_safety),
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  height: 240,
                  width: 250,
                  color: Colors.black12,
                  child: file == null
                      ? const Icon(
                          Icons.image,
                          size: 120,
                        )
                      : Image.file(
                          file!,
                          fit: BoxFit.fill,
                        ),
                ),
                const SizedBox(
                  height: 80,
                ),
                _output != null
                    ? Text(
                        '${_output?[0]['label']}',
                        style: const TextStyle(color: Colors.redAccent),
                      )
                    : Container(),
                GestureDetector(
                  onTap: () {
                    getgall();
                  },
                  child: Container(
                    height: 30,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 227, 14, 53)),
                    child: const Center(
                      child: Text(
                        "Take from Gallery",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    getcam();
                  },
                  child: Container(
                    height: 30,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(255, 227, 14, 53)),
                    child: const Center(
                      child: Text(
                        "Take from Camera",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
