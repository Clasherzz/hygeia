import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:image/image.dart' as img;
Function<void> outPut() async{

  final interpreter = await tfl.Interpreter.fromAsset('assets/your_model.tflite');
  List<List<List<double>>> imageToInputTensor(img.Image image) {
  var inputShape = interpreter.getInputTensor(0).shape;
  var inputData = List.filled(inputShape.reduce((a, b) => a * b), 0)
      .reshape(inputShape);

  for (var y = 0; y < inputShape[1]; y++) {
    for (var x = 0; x < inputShape[2]; x++) {
      var pixel = image.getPixel(x, y);

      // Normalize the pixel values to be in the range [0, 1]
      inputData[0][y][x][0] = img.getRed(pixel) / 255.0;
      inputData[0][y][x][1] = img.getGreen(pixel) / 255.0;
      inputData[0][y][x][2] = img.getBlue(pixel) / 255.0;
    }
  }
}