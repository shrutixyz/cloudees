import 'dart:io';

import 'package:cloudees/requests/request.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  _PredictionState createState() => _PredictionState();
}

File hehe = File('assets/test.jpg');

class _PredictionState extends State<Prediction> {
  bool isloaded = false;
  loadScreen() {
    if (!isloaded) {
      return CircularProgressIndicator();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            txt,
            style: TextStyle(fontSize: 40),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebView(
                            javascriptMode: JavascriptMode.unrestricted,
                            initialUrl:
                                "https://en.wikipedia.org/wiki/${txt}_cloud",
                          )));
            },
            icon: Icon(
              Icons.info_outline_rounded,
              color: Theme.of(context).shadowColor,
            ),
          )
        ],
      );
    }
  }

  bool gotResults = false;
  resUpdate() {
    if (gotResults) {
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20), child: loadScreen());
    } else {
      return InkWell(
          onTap: () async {
            setState(() {
              gotResults = true;
              txt = "fetching...";
            });
            var res = await uploadImage(
                    hehe.path, "http://cloudees.herokuapp.com/predict")
                .catchError((err) {
              setState(() {
                txt = err.toString();
              });
            });
            setState(() {
              txt = res.toString();
              isloaded = true;
            });
            print(res);
          },
          child: Container(
            // minWidth: 100,
            // height: 80,
            // color: Colors.blueGrey,

            width: 250,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.settings_overscan_outlined,
                    color: Theme.of(context).shadowColor),
                Text(
                  "Get Results",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ));
    }
  }

  returnWidget() {}
  bool btnVis = true;
  bool resVis = false;
  String txt = "fetching...";
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
                height: w - 40,
                width: w - 40,
                child: Image.file(hehe,
                    fit: BoxFit.cover, alignment: Alignment.topCenter)),
          ),
          // gotResults(),
          SizedBox(
            height: 40,
          ),
          resUpdate()
        ],
      )),
    );
  }
}



// check(txt) {
//   if (isloading) {
//     return CircularProgressIndicator();
//   } else {
//     return Text(txt);
//   }
// }
