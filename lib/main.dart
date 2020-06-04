import 'package:covid_19/animation.dart';
import 'package:covid_19/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Color primaryColor = Color(0xFF7ddbf4);
  AnimationController translateController;
  Animation<double> translateAnimation;
  AnimationController scaleController;
  Animation<double> scaleAnimation;
  bool buttonClicked = false;
  @override
  void initState() {
    translateController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              scaleController.forward();
              setState(() {
                buttonClicked = true;
              });
            }
          });
    scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: SecondPage(),
                ),
              );
            }
          });
    translateAnimation =
        Tween<double>(begin: 0, end: 240).animate(translateController);
    scaleAnimation = Tween<double>(begin: 1, end: 40).animate(scaleController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: primaryColor,
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: primaryColor,
                    image: DecorationImage(
                      image: AssetImage("images/back2.jpg"),
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    delay: 1.5,
                    child: Text(
                      "STAY HOME",
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                  ),
                  FadeAnimation(
                    delay: 2,
                    child: Text(
                      "STAY SAFE",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    delay: 3,
                    child: Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Text(
                        "The COVID-19 virus is a new virus linked to the same family of viruses as Severe Acute Respiratory Syndrome (SARS) and some types of common cold.",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        translateController.forward();
                      },
                      child: FadeAnimation(
                        delay: 4,
                        child: AnimatedBuilder(
                          animation: translateAnimation,
                          builder: (context, child) => Transform.translate(
                            offset: Offset(translateAnimation.value, 0),
                            child: AnimatedBuilder(
                              animation: scaleAnimation,
                              builder: (context, child) => Transform.scale(
                                scale: scaleAnimation.value,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: buttonClicked
                                          ? primaryColor
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
