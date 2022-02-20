import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/services.dart';

Future<String?> uploadImage(filepath, url) async {
  print("starting");
  var request = http.MultipartRequest('POST', Uri.parse(url));
  var multipartFile = http.MultipartFile.fromBytes(
    'sent_file',
    (await rootBundle.load(
            'https://media.discordapp.net/attachments/873911460055642152/944480235607449610/17.jpg'))
        .buffer
        .asUint8List(),
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
  return res.stream.toString();
}
