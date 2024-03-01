// 

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hygeia/http.dart';
import 'package:image_picker/image_picker.dart';
import 'http.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Classification App',
      theme: ThemeData(
        primaryColor: Colors.green, // Set the primary color to green
      ),
      home: ImageClassificationPage(),
    );
  }
}

class ImageClassificationPage extends StatefulWidget {
  @override
  _ImageClassificationPageState createState() => _ImageClassificationPageState();
}

class _ImageClassificationPageState extends State<ImageClassificationPage> {
  String result = "";
  File? imageFile;

  Future<void> _classifyImage() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      String imagePath = imageFile!.path;
      sendPhoto(imagePath);
      // Call your function for image classification here

      setState(() {
        // Update the UI based on the classification result
        // result = classificationResult![0]['label'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hygeia', style: TextStyle(color: Colors.white)), // Set text color to white
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageFile != null) Image.file(imageFile!, height: 200),
            SizedBox(height: 20),
            Text(result, style: TextStyle(color: Colors.green)), // Set text color to green
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _classifyImage,
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Set button color to green
              ),
              child: Text('Classify Image'),
            ),
          ],
        ),
      ),
    );
  }
}
