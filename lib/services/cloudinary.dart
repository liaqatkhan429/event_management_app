import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class CloudinaryService {

  final String cloudName = "dbn4krkjs";
  final String uploadPreset = "personal_details";

  /// Image upload function
  Future<String?> uploadImage(File imageFile) async {
    try {
      final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
      );

      var request = http.MultipartRequest("POST", url);

      /// Image file attach
      request.files.add(
        await http.MultipartFile.fromPath("file", imageFile.path),
      );

      /// Upload preset attach (unsigned upload)
      request.fields['upload_preset'] = uploadPreset;

      var response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonData = jsonDecode(responseData);

        String imageUrl = jsonData['secure_url'];
        print("✅ Upload Success: $imageUrl");

        return imageUrl;
      } else {
        print("❌ Upload Failed: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Error Uploading Image: $e");
      return null;
    }
  }
  

}
