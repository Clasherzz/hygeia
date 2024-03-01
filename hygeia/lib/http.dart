import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> sendPhoto(String imagePath) async {
  Uri apiUrl = Uri.parse("http://192.168.241.26/predict");

  // Create a multipart request
  var request = http.MultipartRequest('POST', apiUrl);

  // Attach the image file
  request.files.add(await http.MultipartFile.fromPath('image', imagePath));

  // Send the request
  var response = await request.send();

  // Check the response
  if (response.statusCode == 200) {
    print('Photo successfully sent!');
    print(await response.stream.bytesToString());
  } else {
    print('Failed to send photo. Status code: ${response.statusCode}');
  }
}


