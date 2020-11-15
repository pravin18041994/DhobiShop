import 'package:flutter/material.dart';

import 'LaundaryListPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex;
  int selectedLaundary = 0;
  List laundaries = ["abc", "xyz", "pqr", "def", "lkm", "pqp", "adt"];
  List services = [
    "All",
    "Wash and Fold",
    "Wash and Iron",
    "DryCleaning",
    "Only Iron",
    "Only Wash",
    "Hand Wash"
  ];

  var _selectedPage;
  var selectedIndexBotton = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "Location",
                              style: TextStyle(color: Colors.white24),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "Pune",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () {},
                        icon: Icon(Icons.location_on),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: TextField(
                      showCursor: false,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusColor: Colors.transparent,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search you laundary",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                              text: "Top Services",
                              style: TextStyle(
                                  color: Colors.blue[200], fontSize: 15)),
                        ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        margin: EdgeInsets.symmetric(vertical: 20 / 2),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: services.length,
                            shrinkWrap: true,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: index == selectedIndex
                                          ? Colors.white.withOpacity(0.4)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Text(
                                    services[index],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }))
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.all(10),
                        child: RichText(
                          text: TextSpan(
                              text: "Popular Laundary Nearbuy",
                              style: TextStyle(
                                  color: Colors.blue[200], fontSize: 13)),
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return LaundaryListPage();
                            }));
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.blue[200],
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: laundaries.length,
                    itemBuilder: (ctx, index) => Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: 250,
                      child: Card(
                        color: Colors.blue.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.white)),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Icon(
                                Icons.label,
                                size: 90,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    laundaries[index] + " Laundary",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star_border,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text(
                                        "2.4",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Near post office",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
