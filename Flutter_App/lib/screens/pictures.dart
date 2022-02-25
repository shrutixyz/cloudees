import 'package:flutter/material.dart';

class Pictures extends StatefulWidget {
  const Pictures({Key? key}) : super(key: key);

  @override
  _PicturesState createState() => _PicturesState();
}

class _PicturesState extends State<Pictures> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            "Cloudees Gallery",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              cloudCont(w, "altocumulus", setState, context),
              cloudCont(w, "cirrocumulus", setState, context),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              cloudCont(w, "cirrostratus", setState, context),
              cloudCont(w, "cirrus", setState, context),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              cloudCont(w, "cumulonimbus", setState, context),
              cloudCont(w, "cumulus", setState, context),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              cloudCont(w, "nimbostratus", setState, context),
              cloudCont(w, "stratocumulus", setState, context),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[cloudCont(w, "stratus", setState, context)],
            ),
          )
        ],
      ))),
    );
  }
}

cloudCont(w, txt, setState, context) {
  return InkWell(
      onTap: () {
        setState(() {
          cloud = txt;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ImagesViewer()));
        });
      },
      child: Container(
          height: 300,
          width: w - 40,
          child: Stack(
            children: <Widget>[
              Container(
                width: w - 20,
                height: 300,
                // color: Colors.pink,
                child: Image.asset(
                  "assets/gallery/$txt/1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        txt,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  height: 300.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.0),
                            Colors.black,
                          ],
                          stops: [
                            0.0,
                            1.0
                          ])))
            ],
          )));
}

String cloud = "altocumulus";

class ImagesViewer extends StatelessWidget {
  const ImagesViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      body: Container(
          child: GridView.count(
        crossAxisCount: 2,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/0.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/1.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/2.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/3.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/4.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/5.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/6.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/7.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/8.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "assets/gallery/$cloud/9.jpg",
              height: w - 20,
              width: 2 - 20,
            ),
          ),
        ],
      )),
    );
  }
}
