import 'dart:io';
import 'package:cloudees/utils/classifier.dart';
import 'package:cloudees/utils/classifier_quant.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  _PredictionState createState() => _PredictionState();
}

File hehe = File('assets/test.jpg');
bool isAdNeverOpened = true;

class _PredictionState extends State<Prediction> {
  bool isloaded = false;
  late Classifier _classifier;
  late final List<MapEntry<String, double>> data;
  bool showloader = false;
  bool loadedPredAd = false;
  @override
  void initState() {
    super.initState();
    if (isAdNeverOpened) {
      _createInterstitialAd();
    }
    myBanner.load();
    setState(() {
      loadedPredAd = true;
    });

    _classifier = ClassifierQuant();
  }

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-2604459233240782/4005744250',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );
  final BannerAdListener listener = BannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => print('Ad impression.'),
  );

  Future<List<MapEntry<String, double>>> _predict() async {
    print("here");
    img.Image imageInput = img.decodeImage(hehe.readAsBytesSync())!;
    var cropSize = imageInput.width;
    final imageBytes = img.decodeImage(hehe.readAsBytesSync())!;

// setStat
    img.Image cropOne = img.copyCrop(
      imageBytes,
      0,
      0,
      cropSize,
      cropSize,
    );

    // img.Image cropFinal = img.copyResize(cropOne, height: 1000, width: 1000);

    List<MapEntry<String, double>> pred = _classifier.predict(cropOne);
    return pred;
  }

  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  int maxFailedLoadAttempts = 3;

  void _createInterstitialAd() {
    setState(() {
      isAdNeverOpened = false;
    });
    InterstitialAd.load(
      adUnitId: "ca-app-pub-2604459233240782/7562718027",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _showInterstitialAd();
        },
        onAdFailedToLoad: (LoadAdError error) {
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Prediction()));
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  loadScreen() {
    print("data hai" + data.toString());
    if (showloader) {
      return CircularProgressIndicator();
    } else {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.last.key.split(" ")[1],
                  style: TextStyle(fontSize: 40),
                ),
                IconButton(
                  onPressed: () async {
                    final controller = WebViewController()
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..setBackgroundColor(const Color(0x00000000))
                      ..setNavigationDelegate(
                        NavigationDelegate(
                          onProgress: (int progress) {
                            // Update loading bar.
                          },
                          onPageStarted: (String url) {},
                          onPageFinished: (String url) {},
                          onWebResourceError: (WebResourceError error) {},
                          onNavigationRequest: (NavigationRequest request) {
                            if (request.url
                                .startsWith('https://www.youtube.com/')) {
                              return NavigationDecision.prevent;
                            }
                            return NavigationDecision.navigate;
                          },
                        ),
                      )
                      ..loadRequest(Uri.parse(
                          "https://en.wikipedia.org/wiki/${data.last.key.split(" ")[1].toLowerCase()}_cloud"));

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                WebViewWidget(controller: controller))));
                  },
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: Theme.of(context).shadowColor,
                  ),
                ),
              ],
            ),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  //Hide the gridlines of x-axis
                  majorGridLines: MajorGridLines(width: 0),
                  //Hide the axis line of x-axis
                  axisLine: AxisLine(width: 0),
                ),
                primaryYAxis: NumericAxis(
                    //Hide the gridlines of y-axis
                    majorGridLines: MajorGridLines(width: 0),
                    //Hide the axis line of y-axis
                    axisLine: AxisLine(width: 0),
                    minimum: 0,
                    maximum: 100,
                    interval: 25),
                enableSideBySideSeriesPlacement: true,
                plotAreaBackgroundColor: Colors.transparent,
                plotAreaBorderColor: Colors.transparent,
                series: <ChartSeries<MapEntry<String, double>, String>>[
                  BarSeries<MapEntry<String, double>, String>(
                      isTrackVisible: true,
                      trackColor: Color.fromRGBO(160, 82, 255, 0.1),
                      dataSource: data,
                      xValueMapper: (MapEntry<String, double> data, _) =>
                          data.key.split(" ")[1],
                      yValueMapper: (MapEntry<String, double> data, _) =>
                          data.value,
                      name: 'Gold',
                      color: Color.fromRGBO(160, 82, 255, 1))
                ]),
          ],
        ),
      );
    }
  }

  bool gotResults = false;
  resUpdate() {
    if (gotResults) {
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20), child: loadScreen());
    } else {
      return InkWell(
          onTap: () async {
            setState(() {
              showloader = true;
              gotResults = true;
              txt = "fetching...";
            });
            print("--================================predict");
            var res = await _predict();
            print("==============================predicted");
            setState(() {
              showloader = false;
              data = res;
              isloaded = true;
            });
            print(res);
          },
          child: Container(
            width: 250,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            child: showloader
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(Icons.settings_overscan_outlined,
                          color: Theme.of(context).shadowColor),
                      Text(
                        "Get Results",
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
          ));
    }
  }

  returnWidget() {}
  bool btnVis = true;
  bool resVis = false;
  String txt = "fetching...";
  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: myBanner);
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              height: w - 40,
              width: w - 40,
              child: Image.file(
                hehe,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            resUpdate(),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: loadedPredAd ? adWidget : SizedBox(),
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
