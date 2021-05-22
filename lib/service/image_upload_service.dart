import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

String api = FlutterConfig.get('API_URL');

class ImageUpload {
  Future<bool> uploadUserImage(
      String jwt, PickedFile pickedFile, String userId) async {
    File imageFile = File(pickedFile.path);
    var fileName = (imageFile.path.split('/').last);
    List<String> fn = fileName.split(".");
    String extension = fn[1];

    String dir = path.dirname(imageFile.path);
    String newPath = path.join(dir, '$userId.$extension');
    imageFile = imageFile.renameSync(newPath);

    var stream = new http.ByteStream(imageFile.openRead());
    stream.cast();
    var length = await imageFile.length();

    var uri = Uri.parse(
      api + "/images/upload",
    );

    var request = new http.MultipartRequest(
      "POST",
      uri,
    );
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    request.headers.addAll(
      {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
    );
    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
