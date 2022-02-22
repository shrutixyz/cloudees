import 'package:flutter/material.dart';

class Usage extends StatelessWidget {
  const Usage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Skip"),
          ),
          // Container(
          //   height: 800 * 0.8,
          //   width: 450 * 0.8,
          //   color: Colors.pink,
          // ),
          finalScreen(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                onPressed: () {},
                child: Text("previous"),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("next"),
              )
            ],
          )
        ],
      ))),
    );
  }
}

finalScreen(context) {
  return Container(
    height: 800 * 0.8,
    width: 450 * 0.8,
    color: Colors.lightBlueAccent,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "woohoo!! this is all you need to get started with cloudees",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        MaterialButton(
          color: Colors.deepPurple[200],
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("lets begin"),
        )
      ],
    ),
  );
}
