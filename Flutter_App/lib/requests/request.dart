import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<String> uploadImage(filepath, url) async {
  print("starting");
  var request = http.MultipartRequest('POST', Uri.parse(url));
  var multipartFile = http.MultipartFile.fromBytes(
    'sent_file', await File(filepath).readAsBytes(),
    // (await rootBundle.load(filepath.toString())).buffer.asUint8List(),
    filename: 'test.jpg', // use the real name if available, or omit
    contentType: MediaType('image', 'jpg'),
  );
  request.files.add(multipartFile);
  var res = await request.send();
  var hehe = await res.stream.bytesToString();
  print(res.toString());
  // setState(() {
  //   // fml = res.stream.toString();
  //   fml = hehe.toString();
  // });
  return hehe.toString();
}
