import 'package:cloudees/constants/colors.dart';
import 'package:cloudees/constants/routes.dart';
import 'package:cloudees/screens/error.dart';
import 'package:cloudees/screens/home.dart';
import 'package:cloudees/screens/prediction.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
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
        primaryIconTheme: IconThemeData(color: Color.fromRGBO(31, 150, 201, 1)),
        iconTheme: IconThemeData(color: Color.fromRGBO(31, 150, 201, 1)),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            color: lightbg,
            systemOverlayStyle: SystemUiOverlayStyle.light),
        brightness: Brightness.light,
        backgroundColor: lightbg,
        primaryColor: Color.fromARGB(255, 190, 192, 196),
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: lightbg,
      ),
      dark: ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: darkbg,
            systemOverlayStyle: SystemUiOverlayStyle.dark),
        scaffoldBackgroundColor: darkbg,
        primaryColor: Color.fromARGB(255, 33, 40, 44),
        backgroundColor: darkbg,
        brightness: Brightness.dark,
        primarySwatch: Colors.brown,
      ),
      initial: AdaptiveThemeMode.light,
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
