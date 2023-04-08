import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Learn extends StatelessWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          //     child: WebView(
          //   initialUrl:
          //       "https://github.com/shrutigupta5555/cloudees/tree/main/Flutter_App",
          //   javascriptMode: JavascriptMode.unrestricted,
          // )
          ),
    ));
  }
}
