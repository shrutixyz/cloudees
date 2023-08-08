import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "OOPS! Some unknown error has been detected. Please try re-opening the application",
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}
