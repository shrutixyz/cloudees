import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

drawer(context) {
  return Container(
    // height: height,
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
