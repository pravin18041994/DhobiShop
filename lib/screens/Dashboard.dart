import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:real_washer/screens/LaundaryFullDetailsPage.dart';
import 'package:real_washer/screens/LaundaryListPage.dart';
import 'package:real_washer/screens/UserDrawer.dart';
import 'package:shimmer/shimmer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedIndexBotton = 0;
      _selectedPage = Dashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          iconSize: 18.0,
          selectedLabelStyle: TextStyle(fontSize: 12.0),
          onTap: (int index) {
            if (index == 0) {
              setState(() {
                _selectedPage = Dashboard();
                selectedIndexBotton = 0;
              });
            } else if (index == 1) {
              setState(() {
                selectedIndexBotton = 1;
              });
            } else if (index == 2) {
              setState(() {
                selectedIndexBotton = 2;
              });
            }
          },
          currentIndex: selectedIndexBotton,
          elevation: 40.0,
          backgroundColor: Colors.blue[800],
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.info,
                ),
                label: "Profile"),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xF0F8FF),
        elevation: 0,
        title: Text("Hi user"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter), onPressed: () {})
        ],
      ),
      drawer: UserDrawer(),
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
                CarouselSlider(
                  options: CarouselOptions(
                      height: 130.0,
                      viewportFraction: 0.7,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.easeOutCirc,
                      enlargeCenterPage: true,
                      // onPageChanged: callbackFunction,

                      scrollDirection: Axis.horizontal),
                  items: [
                    1,
                    2,
                    3,
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 10.0,
                            margin: EdgeInsets.all(4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            borderOnForeground: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              "https://picsum.photos/200/300",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: laundaries.length,
                    itemBuilder: (ctx, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => LaundaryFullDetailsPage()));
                      },
                      child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              fontSize: 16,
                                              color: Colors.white),
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
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class Dashboard extends StatefulWidget {
//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   List services = [
//     "Wash and Fold",
//     "Wash and Iron",
//     "DryCleaning",
//     "Only Iron",
//     "Only Wash",
//     "Hand Wash"
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                     margin: EdgeInsets.only(left: 10),
//                     child: Text("Location ")),
//                 Container(
//                   margin: EdgeInsets.only(right: 10),
//                   child: FaIcon(
//                     FontAwesomeIcons.locationArrow,
//                     color: Colors.grey,
//                     size: 15,
//                   ),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                     margin: EdgeInsets.only(left: 10), child: Text("Pune ")),
//                 Container(
//                     margin: EdgeInsets.only(right: 10),
//                     child: Text(
//                       "Change ",
//                       style: TextStyle(fontSize: 10),
//                     )),
//               ],
//             ),
//             TabBar(
//               isScrollable: true,
//               labelColor: Colors.blue,
//               indicatorColor: Colors.blue[700],
//               unselectedLabelColor: Colors.black,
//               labelStyle: TextStyle(fontWeight: FontWeight.bold),
//               tabs: [
//                 Tab(
//                   text: "Abc laundary",
//                 ),
//                 Tab(
//                   text: "def laundary",
//                 ),
//                 Tab(
//                   text: "ijk laundary",
//                 ),
//                 Tab(
//                   text: "pqr laundary",
//                 ),
//                 Tab(
//                   text: "xyz laundary",
//                 ),
//               ],
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.80,
//               child: TabBarView(children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height,
//                   child: ListView.builder(
//                       itemCount: services.length,
//                       itemBuilder: (ctx, index) => Container(
//                             height: MediaQuery.of(context).size.height * 0.15,
//                             width: MediaQuery.of(context).size.width,
//                             child: Card(
//                               color: Colors.cyan,
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: <Widget>[
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: <Widget>[
//                                       Text(
//                                         services[index],
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 20.0),
//                                       ),
//                                       Icon(
//                                         Icons.import_contacts,
//                                         size: 35,
//                                         color: Colors.white,
//                                       )
//                                     ],
//                                   ),
//                                   Text(
//                                     "Rs 35/kg",
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 20),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )),
//                 ),
//                 Container(),
//                 Container(),
//                 Container(),
//                 Container(),
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
