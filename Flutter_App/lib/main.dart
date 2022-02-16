import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

String? res;
void main() async {
  runApp(MyApp());
  res = await Tflite.loadModel(
      model: "assets/model.tflite",
      numThreads: 1, // defaults to 1
      isAsset:
          true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate:
          false // defaults to false, set to true to use GPU delegate
      );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  calculate() async {
    await Tflite.runModelOnImage(
        path: "", // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(onPressed: () async {
          await calculate();
        }),
      ),
    );
  }
}
