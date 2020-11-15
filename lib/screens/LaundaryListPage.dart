import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_washer/screens/LaundaryFullDetailsPage.dart';

class LaundaryListPage extends StatefulWidget {
  @override
  _LaundaryListPageState createState() => _LaundaryListPageState();
}

class _LaundaryListPageState extends State<LaundaryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[900],
        title: Text("Nearbuy Laundaries"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.blue[200],
                        size: 15,
                      ),
                      Text(
                        "Pune",
                        style: TextStyle(color: Colors.blue[200], fontSize: 13),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        color: Colors.blue[200],
                        size: 15,
                      ),
                      Text(
                        "change",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.blue[200],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index) => Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LaundaryFullDetailsPage()));
                          },
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.blue,
                            margin: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                  "Images/laundaryimg1.jpg",
                                  fit: BoxFit.cover,
                                  width: 130,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.58,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Laundary Name"),
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.star_border),
                                                Text("3.5")
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text("Opens:"),
                                                Text("10 am")
                                              ],
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Text("Closes:"),
                                                Text("6 pm")
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text(
                                            "Services : ",
                                          ),
                                          Text(
                                            "Wash",
                                          ),
                                          Text(
                                            "Iron",
                                          ),
                                          Text(
                                            "Dryclean",
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              "Accepts same day delivery",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              "T&C apply",
                                              style: TextStyle(fontSize: 7),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              "Accepts orders on KG basis",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "2 km ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            "away",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
