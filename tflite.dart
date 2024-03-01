import 'dart:typed_data';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;


// Load model
Future<void> _loadModel() async {
    // final options = InterpreterOptions();

    // Load model from assets
    // final interpreter = await tfl.Interpreter.fromAsset('./assets/model.tflite', options: options);
    // Get tensor input shape [1, 224, 224, 3]
    final interpreter = await tfl.Interpreter.fromAsset('./assets/model.tflite');
    final inputTensor = interpreter.getInputTensors().first;
    // Get tensor output shape [1, 1001]
    final outputTensor = interpreter.getOutputTensors().first;
}

// Load labels from assets
Future<void> _loadLabels() async {
    final labelTxt = await rootBundle.loadString(labelsPath);
    labels = labelTxt.split('\n');
}

Future<void> runInferenceOnImage(String imagePath) async {
  // Load the image from file
  img.Image image = img.decodeImage(await File(imagePath).readAsBytes());

  // Resize the image to match the expected input size [224, 224]
  img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

  // Convert the image to a 3D matrix
  List<List<List<num>>> imageMatrix = List.generate(
      1,
      (i) => List.generate(
          224,
          (j) => List.generate(
              224,
              (k) => resizedImage.getPixel(j, k) / 255.0,
          ),
      ),
  );

  // Run inference
  await runInference(imageMatrix);
}
