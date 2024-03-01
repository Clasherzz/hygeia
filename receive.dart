 import "dart:ui";

import "package:http/http.dart" as http;
 import "dart:io";
 import "dart:typed_data";
 Future<Image> loadImage() async {
    late http.Client client;
    //late Image image;

    final response = await client.get(Uri.parse("http://your_server_ip:5000/get_image"));

    if (response.statusCode == 200) {
      final Uint8List bytes = response.bodyBytes;

      
      Image image = Image.memory(bytes);
      return image;
      
    } else {
      print('Failed to load image. Status code: ${response.statusCode}');
      return Image.memory()
    }
  }