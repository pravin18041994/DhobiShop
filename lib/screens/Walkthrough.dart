// import 'package:flutter/material.dart';

// import 'WalkthroughPage1.dart';
// import 'WalkthroughPage2.dart';
// import 'WalkthroughPage3.dart';

// class Walkthrough extends StatefulWidget {
//   @override
//   _WalkthroughState createState() => _WalkthroughState();
// }

// class _WalkthroughState extends State<Walkthrough> {
//   var pageController = PageController(initialPage: 1);
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child : PageView(
//         pageSnapping: true,
//         physics: const AlwaysScrollableScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           WalkthroughPage1(),
//           WalkthroughPage2(),
//           WalkthroughPage3(),
//       ],)
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:real_washer/screens/Dashboard.dart';
import 'package:real_washer/screens/LoginPage.dart';
import 'package:real_washer/screens/MainPage.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  int currentPage = 0;
  List data = [
    {"text": "Welcome to DhobiShop,lets wash !", "image": "Images/img1.png"},
    {"text": "Search laundries nearbuy,easily !", "image": "Images/img1.png"},
    {
      "text": "Select your laundry and schedule according to you !",
      "image": "Images/img1.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: data.length,
                      itemBuilder: (ctx, index) => Column(
                            children: <Widget>[
                              Spacer(),
                              Text(
                                "DhobiShop",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36),
                              ),
                              Text(
                                data[index]['text'],
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.blue),
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Image.asset(
                                data[index]['image'],
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width * 0.95,
                              ),
                              Spacer(),
                            ],
                          ))),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          data.length,
                          (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            margin: EdgeInsets.only(right: 5),
                            height: 6,
                            width: currentPage == index ? 16 : 6,
                            decoration: BoxDecoration(
                                color: currentPage == index
                                    ? Colors.blue
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(3)),
                          ),
                        )),
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: FlatButton(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          },
                          child: Text(
                            "Lets get started",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
