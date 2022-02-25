import 'dart:async';
import 'dart:io';
import 'package:cloudees/screens/about.dart';
import 'package:cloudees/screens/learn.dart';
import 'package:cloudees/screens/pictures.dart';
import 'package:cloudees/screens/privacy.dart';
import 'package:cloudees/screens/tandc.dart';
import 'package:cloudees/screens/usage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cloudees/main.dart';
import 'package:cloudees/screens/prediction.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List<String> quotes = [
  "today is your day",
  "you've been doing amazing",
  "wish you all the luck",
  "you're beautiful, just like the clouds",
  "ecstacy",
  "stay awesome",
  "clouds are pretty, and so are you",
];
Random random = new Random();
int imageIndex = 0;
int quoteIndex = 0;
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
int _start = 3;

class _HomeState extends State<Home> {
  late Timer _timer;

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

  // Color bgcolor = ;
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[index], ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.jpeg, enableAudio: true);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    controller!.setFlashMode(FlashMode.off);
    quoteIndex = random.nextInt(6);
    imageIndex = random.nextInt(4);
    op = 1;
    isGridOn = true;
    gridIcon = Icon(
      Icons.grid_on,
    );
    gridUrl = "assets/grid.png";
    flashIcon = Icon(Icons.flash_off);
    isFlashOn = false;
    timerIcon = Icon(Icons.timer_off);
    isTimerOn = false;
    timerOp = Colors.transparent;
    _start = 3;
  }

  ImagePicker picker = ImagePicker();

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: Drawer(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset("assets/headers/$imageIndex.jpg"),
                  Center(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '"${quotes[quoteIndex]}"',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "  Theme",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(Icons.light_mode_outlined),
                  title: Text("switch mode"),
                  // trailing: Text("hemlo"),
                ),
                onTap: () async {
                  if (await AdaptiveTheme.getThemeMode() ==
                      AdaptiveThemeMode.dark) {
                    AdaptiveTheme.of(context).toggleThemeMode();
                  }
                  AdaptiveTheme.of(context).toggleThemeMode();
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "  Terms",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Privacy()));
                },
                child: ListTile(
                  leading: Icon(Icons.lock_outline_rounded),
                  title: Text("privacy policy"),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Condition()));
                },
                child: ListTile(
                  leading: Icon(Icons.bookmark_outline_outlined),
                  title: Text("terms and conditions"),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                },
                child: ListTile(
                  leading: Icon(Icons.info_outline_rounded),
                  title: Text("about app"),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Usage()));
                },
                child: ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text("how to use"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "  Gallery",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Pictures()));
                },
                child: ListTile(
                  leading: Icon(Icons.picture_in_picture_rounded),
                  title: Text("view pictures"),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Learn()));
                },
                child: ListTile(
                  leading: Icon(Icons.navigation_outlined),
                  title: Text("learn more"),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text("v 1.0.0"),
              )
            ],
          ),
        )),
        // appBar: AppBar(
        //   title: Text(
        //     "cloudees",
        //     style: TextStyle(
        //         fontWeight: FontWeight.w300,
        //         color: Theme.of(context).shadowColor),
        //   ),
        // ),
        key: scaffoldKey,
        body: SafeArea(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // SizedBox(height: 50),

                  Container(
                    // child:
                    child: CameraPreview(controller!,
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  height: w,
                                  width: w,
                                  color: Colors.transparent,
                                  child: Opacity(
                                      opacity: 1,
                                      child: Stack(
                                        children: <Widget>[
                                          Opacity(
                                            opacity: op,
                                            child: Image.asset(
                                              gridUrl,
                                            ),
                                          ),
                                          Center(
                                              child: Opacity(
                                                  opacity: 1,
                                                  child: Text(
                                                    "$_start",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 70,
                                                        color: timerOp),
                                                  ))),
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: MaterialButton(
                                              height: 50,
                                              minWidth: 50,
                                              padding: EdgeInsets.all(5),
                                              child: Icon(Icons.menu),
                                              onPressed: () {
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                              },
                                              shape: CircleBorder(),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Expanded(
                                  // color: darkbg.withOpacity(1),
                                  // height: h - w - 134,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                70, 20, 70, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                MaterialButton(
                                                    height: 50,
                                                    minWidth: 50,
                                                    padding: EdgeInsets.all(5),
                                                    child: gridIcon,
                                                    onPressed: () {
                                                      if (isGridOn) {
                                                        setState(() {
                                                          gridIcon = Icon(
                                                              Icons.grid_off);
                                                          op = 0;
                                                          isGridOn = false;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          gridIcon = Icon(
                                                              Icons.grid_on);
                                                          op = 1;
                                                          isGridOn = true;
                                                        });
                                                      }
                                                    },
                                                    shape: CircleBorder(),
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                MaterialButton(
                                                  height: 50,
                                                  minWidth: 50,
                                                  padding: EdgeInsets.all(5),
                                                  child: flashIcon,
                                                  onPressed: () {
                                                    // log("pressed");
                                                    if (isFlashOn) {
                                                      controller
                                                          ?.setFlashMode(
                                                              FlashMode.off)
                                                          .then((_) =>
                                                              {print("done")});
                                                      setState(() {
                                                        flashIcon = Icon(
                                                            Icons.flash_off);
                                                        isFlashOn = false;
                                                      });
                                                    } else {
                                                      controller
                                                          ?.setFlashMode(
                                                              FlashMode.always)
                                                          .then((_) =>
                                                              {print("done")});
                                                      setState(() {
                                                        flashIcon = Icon(
                                                            Icons.flash_on);
                                                        isFlashOn = true;
                                                      });
                                                    }
                                                  },
                                                  shape: CircleBorder(),
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                MaterialButton(
                                                    height: 50,
                                                    minWidth: 50,
                                                    padding: EdgeInsets.all(5),
                                                    child: timerIcon,
                                                    onPressed: () {
                                                      if (isTimerOn) {
                                                        setState(() {
                                                          timerIcon = Icon(
                                                              Icons.timer_off);
                                                          isTimerOn = false;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          timerIcon = Icon(
                                                              Icons.timer_3);
                                                          isTimerOn = true;
                                                          _start = 3;
                                                        });
                                                      }
                                                    },
                                                    shape: CircleBorder(),
                                                    color: Theme.of(context)
                                                        .primaryColor)
                                              ],
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            MaterialButton(
                                              height: 65,
                                              minWidth: 65,
                                              shape: CircleBorder(
                                                  side: BorderSide(
                                                      color: Theme.of(context)
                                                          .dividerColor)),
                                              onPressed: () {
                                                if (index == 0) {
                                                  index = 1;
                                                } else {
                                                  index = 0;
                                                }
                                                setState(() {
                                                  controller = CameraController(
                                                      cameras[index],
                                                      ResolutionPreset.max);
                                                  controller
                                                      ?.initialize()
                                                      .then((_) {
                                                    if (!mounted) {
                                                      return;
                                                    }
                                                    setState(() {});
                                                  });
                                                });
                                              },
                                              child: Icon(
                                                Icons.flip_camera_ios_outlined,
                                                color: Theme.of(context)
                                                    .dividerColor,
                                              ),
                                            ),
                                            MaterialButton(
                                              height: 100,
                                              minWidth: 100,
                                              shape: CircleBorder(
                                                  side: BorderSide(
                                                color: Theme.of(context)
                                                    .dividerColor,
                                              )),
                                              onPressed: () {
                                                if (isTimerOn) {
                                                  setState(() {
                                                    timerOp = Colors.white60;
                                                    _start = 3;
                                                  });
                                                  startTimer();
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 3000),
                                                      () {
                                                    controller
                                                        ?.takePicture()
                                                        .then((value) => {
                                                              setState(() {
                                                                hehe = File(
                                                                    value.path);
                                                              }),
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              Prediction()))
                                                            });
                                                    setState(() {
                                                      timerOp =
                                                          Colors.transparent;
                                                      _start = 3;
                                                    });
                                                  });
                                                } else {
                                                  controller
                                                      ?.takePicture()
                                                      .then((value) => {
                                                            setState(() {
                                                              hehe = File(
                                                                  value.path);
                                                            }),
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Prediction()))
                                                          });
                                                }
                                              },
                                              child: Icon(
                                                Icons.circle,
                                                color: Theme.of(context)
                                                    .dividerColor,
                                                size: 85,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                XFile? image =
                                                    await picker.pickImage(
                                                        source:
                                                            ImageSource.gallery,
                                                        ////////////////////////////////////
                                                        maxWidth: 500,
                                                        maxHeight: 500);
                                                setState(() {
                                                  hehe = File(image!.path);
                                                });
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Prediction()));
                                              },
                                              child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    "assets/test.jpg"),
                                                radius: 33,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                    color: Theme.of(context).backgroundColor,
                                    // color: Colors.orange,
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                    color: Colors.black,
                    // height: w,
                    width: w,
                  ),
                ],
              )),
        ));
  }
}
