import 'package:cloudees/constants/colors.dart';
import 'package:cloudees/constants/routes.dart';
import 'package:cloudees/screens/error.dart';
import 'package:cloudees/screens/home.dart';
import 'package:cloudees/screens/prediction.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  MobileAds.instance.initialize();

  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        focusColor: Color.fromRGBO(31, 150, 201, 1),
        buttonTheme: ButtonThemeData(buttonColor: Colors.black),
        listTileTheme: ListTileThemeData(
            iconColor: Colors.black54, textColor: Colors.black54),
        drawerTheme: DrawerThemeData(backgroundColor: lightbg),
        primaryIconTheme: IconThemeData(color: Color.fromRGBO(31, 150, 201, 1)),
        iconTheme: IconThemeData(color: Colors.blue),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            color: lightbg,
            systemOverlayStyle: SystemUiOverlayStyle.light),
        brightness: Brightness.light,
        backgroundColor: lightbg,
        primaryColor: Colors.white,
        primarySwatch: Colors.lightBlue,
        shadowColor: Colors.black,
        scaffoldBackgroundColor: lightbg,
        dividerColor: Color.fromRGBO(31, 150, 201, 1),
        canvasColor: Colors.black,
      ),
      dark: ThemeData(
          canvasColor: Colors.white,
          shadowColor: Colors.white,
          focusColor: Colors.white,
          buttonTheme: ButtonThemeData(buttonColor: Colors.blue),
          listTileTheme: ListTileThemeData(
              iconColor: Colors.white54, textColor: Colors.white54),
          drawerTheme: DrawerThemeData(backgroundColor: darkbg),
          iconTheme: IconThemeData(color: Colors.white),
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              color: darkbg,
              systemOverlayStyle: SystemUiOverlayStyle.dark),
          scaffoldBackgroundColor: darkbg,
          primaryColor: Colors.black,
          backgroundColor: darkbg,
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          dividerColor: Colors.white),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "cloudees",
        routes: {
          home: (context) => Home(),
          error: (context) => Error(),
          prediction: (context) => Prediction(),
        },
        theme: theme,
        darkTheme: darkTheme,
        home: Home(),
      ),
    );
  }
}
