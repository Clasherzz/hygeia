import 'package:tflite/tflite.dart';

class TFLiteHelper {
  static loadModel(String modelPath) async {
    await Tflite.loadModel(
      model: modelPath,
      labels: 'assets/labels.txt',
    );
//     String res = await Tflite.loadModel(
//   model: "assets/models.tflite",
//   labels: "assets/labels.txt",
//   numThreads: 1, // defaults to 1
//   isAsset: true, // defaults to true, set to false to load resources outside assets
//   useGpuDelegate: false // defaults to false, set to true to use GPU delegate
// );
  }

  static classifyImage(String imagePath) async {
    var result = await Tflite.runModelOnImage(
      path: imagePath,
    );
    return result;
  }

  static closeModel() {
    Tflite.close();
  }
}
