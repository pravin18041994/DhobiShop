import 'package:flutter/material.dart';
import 'package:real_washer/screens/Dashboard.dart';
import 'package:real_washer/screens/LoginPage.dart';

import 'WalkthroughPage2.dart';

class WalkthroughPage3 extends StatefulWidget {
  @override
  _WalkthroughPage3State createState() => _WalkthroughPage3State();
}

class _WalkthroughPage3State extends State<WalkthroughPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image.asset("Images/laundaryimg1.jpg"),
              ),
            ),
            Container(
              color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Center(child: Text("Descriptions")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return WalkthroughPage2();
                      }));
                    },
                    child: Text("Previous"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return LoginPage();
                      }));
                    },
                    child: Text("Done"),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class asc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class fer extends StatefulWidget {
  @override
  _ferState createState() => _ferState();
}

class _ferState extends State<fer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}