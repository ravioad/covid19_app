import 'package:covid_19/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Color primaryColor = Color(0xFF7ddbf4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(230),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipPath(
                clipper: OvalRightBorderClipper(),
                child: Container(
                  padding: EdgeInsets.only(top: 40, right: 40),
                  height: 300,
                  width: 200,
                  color: primaryColor,
                  child: FadeAnimation(
                    delay: 1,
                    child: Image.asset("images/doctor.png"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, right: 20, top: 150),
                child: FadeAnimation(
                  delay: 1.5,
                  child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                        text: "Stay Aware\n",
                        style: TextStyle(color: Colors.black87, fontSize: 23),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Stay Healthy!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30))
                        ]),
                  ),
                ),
              )
            ],
          ),
          actions: <Widget>[
            FadeAnimation(
              delay: 1.2,
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                delay: 2.5,
                child: Text("COVID - 19",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              FadeAnimation(
                delay: 2.5,
                child: Text("Symptoms",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    symptom(image: "images/cough.png", title: "Cough"),
                    symptom(image: "images/fever.png", title: "Fever"),
                    symptom(image: "images/headache.png", title: "Headache"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                delay: 3.5,
                child: Text("Preventions",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    prevention(image: "images/hand.png", title: "Wash Hands"),
                    prevention(
                        image: "images/face.png", title: "Avoid Touching Face"),
                    prevention(image: "images/mask.png", title: "Wear Mask"),
                    prevention(
                        image: "images/handshake.png",
                        title: "Avoid Handshakes"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget prevention({image, title}) {
    return FadeAnimation(
      delay: 4,
      child: Container(
        width: 350,
        margin: EdgeInsets.only(right: 20),
        child: Card(
          elevation: 16,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(image),
                ),
                SizedBox(width: 5),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 23,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lorem ipsum dolor sit\namet, an sed homero\nminimum cotidieque...",
                        style: TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("READ MORE",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget symptom({image, title}) {
    return FadeAnimation(
      delay: 3,
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 20),
        child: Card(
          elevation: 16,
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(image),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 23,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, an sed homero minimum cotidieque...",
                        style: TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "READ MORE",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
