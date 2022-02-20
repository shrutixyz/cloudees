import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cloudees/constants/colors.dart';
import 'package:cloudees/main.dart';
import 'package:cloudees/requests/request.dart';
import 'package:cloudees/screens/prediction.dart';
import 'package:cloudees/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

int index = 0;
double op = 1;
bool isGridOn = true;
Icon gridIcon = Icon(Icons.grid_on);
String gridUrl = "assets/grid.png";
Icon flashIcon = Icon(Icons.flash_off);
bool isFlashOn = false;
Icon timerIcon = Icon(Icons.timer_off);
bool isTimerOn = false;
Color timerOp = Colors.transparent;

class _HomeState extends State<Home> {
  late Timer _timer;
  int _start = 3;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  CameraController? controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      cameras[index],
      ResolutionPreset.max,
    );
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    controller!.setFlashMode(FlashMode.off);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: darkbg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 136, 110, 31),
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Theme",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
                  ),
                  Text(
                    "Terms",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
                  ),
                  MaterialButton(
                    onPressed: () {
                      AdaptiveTheme.of(context).setSystem();
                    },
                    child: Text("system"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      AdaptiveTheme.of(context).setDark();
                    },
                    child: Text("dark"),
                  ),
                  MaterialButton(
                    onPressed: () {
                      AdaptiveTheme.of(context).setLight();
                    },
                    child: Text("light"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "cloudees",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                // child:
                child: CameraPreview(
                  controller!,
                  child: Opacity(
                      opacity: op,
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            gridUrl,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Opacity(
                                opacity: 1,
                                child: Text(
                                  "$_start",
                                  style:
                                      TextStyle(fontSize: 70, color: timerOp),
                                )),
                          )
                        ],
                      )),
                ),
                color: Colors.black,
                height: w,
                width: w,
              ),
              Container(
                  height: h - w - 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(70, 40, 70, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              MaterialButton(
                                  height: 50,
                                  minWidth: 50,
                                  padding: EdgeInsets.all(5),
                                  child: gridIcon,
                                  onPressed: () {
                                    if (isGridOn) {
                                      setState(() {
                                        gridIcon = Icon(Icons.grid_off);
                                        op = 0;
                                        isGridOn = false;
                                      });
                                    } else {
                                      setState(() {
                                        gridIcon = Icon(Icons.grid_on);
                                        op = 1;
                                        isGridOn = true;
                                      });
                                    }
                                  },
                                  shape: CircleBorder(),
                                  color: Colors.black),
                              MaterialButton(
                                height: 50,
                                minWidth: 50,
                                padding: EdgeInsets.all(5),
                                child: flashIcon,
                                onPressed: () {
                                  log("pressed");
                                  if (isFlashOn) {
                                    controller
                                        ?.setFlashMode(FlashMode.off)
                                        .then((_) => {log("done")});
                                    setState(() {
                                      flashIcon = Icon(Icons.flash_off);
                                      isFlashOn = false;
                                    });
                                  } else {
                                    controller
                                        ?.setFlashMode(FlashMode.always)
                                        .then((_) => {log("done")});
                                    setState(() {
                                      flashIcon = Icon(Icons.flash_on);
                                      isFlashOn = true;
                                    });
                                  }
                                },
                                shape: CircleBorder(),
                                color: Colors.black,
                              ),
                              MaterialButton(
                                  height: 50,
                                  minWidth: 50,
                                  padding: EdgeInsets.all(5),
                                  child: timerIcon,
                                  onPressed: () {
                                    if (isTimerOn) {
                                      setState(() {
                                        timerIcon = Icon(Icons.timer_off);
                                        isTimerOn = false;
                                      });
                                    } else {
                                      setState(() {
                                        
                                        timerIcon = Icon(Icons.timer_3);
                                        isTimerOn = true;
                                        _start = 3;
                                      });
                                    }
                                  },
                                  shape: CircleBorder(),
                                  color: Colors.black)
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MaterialButton(
                            height: 65,
                            minWidth: 65,
                            shape: CircleBorder(
                                side: BorderSide(
                              color: Colors.white,
                            )),
                            onPressed: () {
                              if (index == 0) {
                                index = 1;
                              } else {
                                index = 0;
                              }
                              setState(() {
                                controller = CameraController(
                                    cameras[index], ResolutionPreset.max);
                                controller?.initialize().then((_) {
                                  if (!mounted) {
                                    return;
                                  }
                                  setState(() {});
                                });
                              });
                            },
                            child: Icon(Icons.flip_camera_ios_outlined),
                          ),
                          MaterialButton(
                            height: 100,
                            minWidth: 100,
                            shape: CircleBorder(
                                side: BorderSide(
                              color: Colors.white,
                            )),
                            onPressed: () {
                              if (isTimerOn) {
                                setState(() {
                                  timerOp = Colors.white60;
                                });
                                startTimer();
                                Future.delayed(
                                    const Duration(milliseconds: 3000), () {
                                  controller?.takePicture().then((value) => {
                                        setState(() {
                                          hehe = File(value.path);
                                        }),
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Prediction()))
                                      });
                                  setState(() {
                                    timerOp = Colors.transparent;
                                    _start = 3;
                                  });
                                });
                              } else {
                                controller?.takePicture().then((value) => {
                                      setState(() {
                                        hehe = File(value.path);
                                      }),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Prediction()))
                                    });
                              }
                            },
                            child: Icon(
                              Icons.circle,
                              size: 85,
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/test.jpg"),
                            radius: 33,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
