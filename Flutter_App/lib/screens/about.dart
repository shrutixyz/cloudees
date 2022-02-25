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
              "Cloudees is an application that lets users classify between clouds through such a simple and clean user interface. A user just need to either click or select an existing image from the gallery, and then they can run the prediction and know what category does that specific cloud fall into. Under the hood, it works by utilising the powers of Deep Learning. Technically, it has been trained over 9000+ images of clouds of 9 major categories, through Convolutional Neural Networks, and has an accuracy of 90%. The request is sent from application to our hosted REST API, which resizes the image accordingly, and then performs the prediction and returns that to our user. So, have fun and enjoy cloud aesthetics <3"),
          SizedBox(
            height: 20,
          ),
        ]),
      )),
    )));
  }
}
