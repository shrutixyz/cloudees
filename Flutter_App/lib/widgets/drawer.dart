import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      child: ListView(
        children: <Widget>[
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
    );
  }
}
