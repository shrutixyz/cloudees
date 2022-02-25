import 'package:flutter/material.dart';

int index = 1;

class Usage extends StatefulWidget {
  const Usage({Key? key}) : super(key: key);

  @override
  _UsageState createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Skip"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   height: 800 * 0.8,
          //   width: 450 * 0.8,
          //   color: Colors.pink,
          // ),
          Image.asset(
            "assets/usage/$index.jpg",
            height: 2 / 3 * h,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  if (index != 4) {
                    setState(() {
                      index++;
                    });
                  } else {
                    setState(() {
                      index = 1;
                    });
                  }
                },
                child: Text("previous"),
              ),
              MaterialButton(
                onPressed: () {
                  if (index != 0) {
                    setState(() {
                      index--;
                    });
                  } else {
                    setState(() {
                      index = 4;
                    });
                  }
                },
                child: Text("next"),
              )
            ],
          )
        ],
      ))),
    );
  }
}
