import 'package:cloudees/constants/routes.dart';
import 'package:cloudees/screens/error.dart';
import 'package:cloudees/screens/home.dart';
import 'package:cloudees/screens/prediction.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

List<CameraDescription>? cameras;

void main() async {
  cameras = await availableCameras();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: "cloudees",
        routes: {
          home: (context) => Home(),
          error: (context) => Error(),
          prediction: (context) => Prediction(),
        },
        home: Home(),
      ),
    );
  }
}
