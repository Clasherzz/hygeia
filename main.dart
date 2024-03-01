import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hygeia/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
//import 'tflite_helper.dart';
import 'hygeia/lib/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Classification App',
      home: ImageClassificationPage(),
    );
  }
}

// class ImageClassificationPage extends StatefulWidget {
//   @override
//   _ImageClassificationPageState createState() => _ImageClassificationPageState();
// }

// class _ImageClassificationPageState extends State<ImageClassificationPage> {
//   String result = 'No Image';
//   File? imageFile;

//   @override
//   void initState() {
//     super.initState();
//     TFLiteHelper.loadModel('assets/model.tflite');
//   }

//   @override
//   void dispose() {
//     TFLiteHelper.closeModel();
//     super.dispose();
//   }

//   /*Future<void> _classifyImage() async {
//     var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       imageFile = File(pickedFile.path);
//       String imagePath = imageFile!.path;
//       var classificationResult = await TFLiteHelper.classifyImage(imagePath);
//       sendPhoto(imagePath);
//       print(classificationResult);
//       setState(() {
//         result = classificationResult![0]['label'];
//       });
//     }
//   }*/

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Classification App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (imageFile != null) Image.file(imageFile!, height: 200),
//             SizedBox(height: 20),
//             Text(result),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _classifyImage,
//               child: Text('Classify Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class ImageClassificationPage extends StatefulWidget {
//   const ImageClassificationPage({super.key});

//   @override
//   State<ImageClassificationPage> createState() => _ImageClassificationPageState();
// }

// class _ImageClassificationPageState extends State<ImageClassificationPage> {
//   String? imageFile;
//   Future<void> _classifyImage() async {
//     var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       imageFile = File(pickedFile.path)??;
//       String imagePath = imageFile!.path;
      
//       sendPhoto(imagePath);
      
//       setState(() {
//         // result = classificationResult![0]['label'];
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Classification App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (imageFile != null) Image.file(imageFile!, height: 200),
//             SizedBox(height: 20),
//             Text(result),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _classifyImage,
//               child: Text('Classify Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   }
// }





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

      await sendPhoto(imagePath);

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
        title: Text('Image Classification App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageFile != null) Image.file(imageFile!, height: 200),
            SizedBox(height: 20),
            Text(result),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _classifyImage,
              child: Text('Classify Image'),
            ),
          ],
        ),
      ),
    );
  }
}
