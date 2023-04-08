import 'dart:io';

import 'package:cloudees/requests/request.dart';
import 'package:cloudees/utils/classifier.dart';
import 'package:cloudees/utils/classifier_quant.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:syncfusion_flutter_charts/charts.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  _PredictionState createState() => _PredictionState();
}

File hehe = File('assets/test.jpg');

class _PredictionState extends State<Prediction> {
  bool isloaded = false;
  late Classifier _classifier;
  late final data;

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierQuant();
  }

  Future<List<MapEntry<String, double>>> _predict() async {
    print("here");
    img.Image imageInput = img.decodeImage(hehe.readAsBytesSync())!;
    List<MapEntry<String, double>> pred = _classifier.predict(imageInput);
    return pred;
  }

  loadScreen() {
    if (!isloaded) {
      return CircularProgressIndicator();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 10),
              series: <ChartSeries<MapEntry<String, double>, String>>[
                BarSeries<MapEntry<String, double>, String>(
                    dataSource: data,
                    xValueMapper: (MapEntry<String, double> data, _) =>
                        data.key.split(" ")[1],
                    yValueMapper: (MapEntry<String, double> data, _) =>
                        data.value,
                    name: 'Gold',
                    color: Color.fromRGBO(8, 142, 255, 1))
              ]),
          // Text(
          //   txt,
          //   style: TextStyle(fontSize: 40),
          // ),
          // IconButton(
          //   onPressed: () {
          //     // Navigator.push(
          //     //     context,
          //     //     MaterialPageRoute(
          //     //         builder: (context) => WebView(
          //     //               javascriptMode: JavascriptMode.unrestricted,
          //     //               initialUrl:
          //     //                   "https://en.wikipedia.org/wiki/${txt}_cloud",
          //     //             )));
          //   },
          //   icon: Icon(
          //     Icons.info_outline_rounded,
          //     color: Theme.of(context).shadowColor,
          //   ),
          // )
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
            // _predict();
            var res = await _predict();

            setState(() {
              data = res;
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
            child: Image.file(hehe),
          )),
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
