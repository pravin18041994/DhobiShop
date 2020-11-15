import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import 'Walkthrough.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;
  var screenName;
  var storage;
  String token, token2;

  // Future<String> getToken() async {
  //   storage = new FlutterSecureStorage();
  //   token = await storage.read(key: "token") ?? null;
  //   if (token == null) {
  //     screenName = Walkthrough();
  //   } else {
  //     screenName = UserDashboard();
  //   }
  // }

  @override
  void initState() {
    // getToken();
    // TODO: implement initState
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (c, a1, a2) => Walkthrough(),
                transitionsBuilder: (c, anim, a2, child) =>
                    FadeTransition(opacity: anim, child: child),
                transitionDuration: Duration(milliseconds: 1300),
              ),
            ));

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));
    super.initState();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue[300],
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedDefaultTextStyle(
                          curve: Curves.bounceInOut,
                          child: Shimmer.fromColors(
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child: Text(
                              "DhobiShop",
                            ),
                          ),
                          style: TextStyle(color: Colors.amber, fontSize: 50.0),
                          duration: Duration(milliseconds: 200)),

                      // RichText(
                      //     text: TextSpan(
                      //         text: "Real",
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 45.0,
                      //             fontWeight: FontWeight.bold),
                      //         children: [
                      //       TextSpan(
                      //         text: "  Washers",
                      //         style: GoogleFonts.greatVibes(
                      //             color: Colors.black,
                      //             fontSize: 30.0,
                      //             fontWeight: FontWeight.bold),
                      //       )
                      //     ])),
                      Text(
                        "Best laundry services near you",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )))

              // Stack(
              //   fit: StackFit.expand,
              //   children: <Widget>[
              //     Container(
              //       child: Image.asset("Images/Logo.png"),
              //       decoration: BoxDecoration(

              //           // image: DecorationImage(
              //           //     image: Image.asset("name"),
              //           //     fit: BoxFit.fitHeight),
              //           color: Colors.white),
              //     ),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: <Widget>[
              //         Expanded(
              //           flex: 2,
              //           child: new Container(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: <Widget>[
              //                 Padding(
              //                   padding: EdgeInsets.only(
              //                     top: 10.0,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
              );
        });
  }
}
