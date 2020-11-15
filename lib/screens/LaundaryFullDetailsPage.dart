import 'package:flutter/material.dart';
import 'package:real_washer/screens/AddItems.dart';

class LaundaryFullDetailsPage extends StatefulWidget {
  @override
  _LaundaryFullDetailsPageState createState() =>
      _LaundaryFullDetailsPageState();
}

class _LaundaryFullDetailsPageState extends State<LaundaryFullDetailsPage> {
  List services = [
    "Wash and Fold",
    "Wash and Iron",
    "DryCleaning",
    "Only Iron",
    "Only Wash",
    "Hand Wash"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "Images/laundaryimg1.jpg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[Icon(Icons.phone), Text("Call")],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.directions),
                              Text("Direction")
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.share),
                              Text("Share")
                            ],
                          )
                        ],
                      ),
                    ),
                    TabBar(
                      isScrollable: true,
                      labelColor: Colors.blue,
                      indicatorColor: Colors.blue[700],
                      unselectedLabelColor: Colors.black,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          text: "About",
                        ),
                        Tab(
                          text: "Services",
                        ),
                        Tab(
                          text: "Rates",
                        ),
                        Tab(
                          text: "Images",
                        ),
                        Tab(
                          text: "Reviews",
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.48,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                        children: [
                          //about
                          Center(
                              child: Text(
                            "Best laundary service provider",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),

                          //Service

                          Container(
                            child: ListView.builder(
                                itemCount: services.length,
                                itemBuilder: (ctx, index) => Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        color: Colors.cyan,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              services[index],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0),
                                            ),
                                            Icon(
                                              Icons.import_contacts,
                                              size: 35,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                          ),

                          //Rates
                          Container(
                            child: ListView.builder(
                                itemCount: services.length,
                                itemBuilder: (ctx, index) => Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        color: Colors.cyan,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                  services[index],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0),
                                                ),
                                                Icon(
                                                  Icons.import_contacts,
                                                  size: 35,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                            Text(
                                              "Rs 35/kg",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                          ),

                          //Images
                          Container(
                            height: MediaQuery.of(context).size.width * 0.4,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: 20,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 1,
                                      crossAxisCount: 4),
                              itemBuilder: (ctx, index) => Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                height: 50,
                                width: 60,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(
                                    "Images/laundaryimg1.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text("No reviews yet"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: RaisedButton(
                  color: Colors.blue[600],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Schedule Pickup",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AddItems()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
