import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(25),
      child: Container(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Text(
            "About Cloudees",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 40),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
              "Cloudees is a whole platform on its own, powered by deep learning models made using Tensorflow libraries including Keras, by optimizing the powers of Habana Gaudi DL1-EC2 instances. Cloudees is available on web with a Flask backend, and on android mobile platform as a Flutter application. A user would need to either click a picture of the sky, or upload an existing one. Cloudees resize the image accordingly, and sends it to our Deep Learning model hosted as a flask API, in form of a POST request, with the image file as an attachment. The app thereafter, receives the response, the most probable category the cloud belongs to, and portrays that to our user in a visually appeasing manner."),
          SizedBox(
            height: 20,
          ),
        ]),
      )),
    )));
  }
}
