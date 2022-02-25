import 'dart:io';

import 'package:cloudees/requests/request.dart';
import 'package:flutter/material.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  _PredictionState createState() => _PredictionState();
}

File hehe = File('assets/test.jpg');

class _PredictionState extends State<Prediction> {
  String txt = "should show up here";
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              height: w,
              width: w,
              child: Image.file(hehe,
                  fit: BoxFit.cover, alignment: Alignment.topCenter)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                onPressed: () async {
                  // post req
                  var res = await uploadImage(hehe.path,
                          "http://cloudees.herokuapp.com/predict")
                      .catchError((err) {
                    setState(() {
                      txt = err.toString();
                    });
                  });
                  setState(() {
                    txt = res.toString();
                  });
                  print(res);
                },
                child: Text("upload"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("retake"),
              )
            ],
          ),
          // FutureBuilder(
          //   future: ,
          //   builder: (ctx, snapshot) {
          //   // Checking if future is resolved
          //   if (snapshot.connectionState == ConnectionState.done) {
          //     // If we got an error
          //     if (snapshot.hasError) {
          //       return Center(
          //         child: Text(
          //           '${snapshot.error} occured',
          //           style: TextStyle(fontSize: 18),
          //         ),
          //       );

          //       // if we got our data
          //     } else if (snapshot.hasData) {
          //       // Extracting data from snapshot object
          //       final data = snapshot.data as String;
          //       return Center(
          //         child: Text(
          //           '$data',
          //           style: TextStyle(fontSize: 18),
          //         ),
          //       );
          //     }
          //   }
          //   return Center(child: Text("hemlo"),);
          // }),
          Text(txt),
        ],
      )),
    );
  }
}
