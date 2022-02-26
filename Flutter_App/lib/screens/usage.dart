import 'package:flutter/material.dart';

int index = 0;

class Usage extends StatefulWidget {
  const Usage({Key? key}) : super(key: key);

  @override
  _UsageState createState() => _UsageState();
}

List<String> imgUrl = [
  "https://i.ibb.co/mDT1QFF/1.png",
  "https://i.ibb.co/VLVnDX1/2.png",
  "https://i.ibb.co/R6c1Sq5/3.png",
  "https://i.ibb.co/pRYJNm5/4.png"
];

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
          Image.network(
            imgUrl[index],
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
                  if (index != 3) {
                    setState(() {
                      index++;
                    });
                  } else {
                    setState(() {
                      index = 0;
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
                      index = 3;
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
