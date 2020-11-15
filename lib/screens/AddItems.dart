import 'package:flutter/material.dart';
import 'package:real_washer/screens/Dashboard.dart';

class AddItems extends StatefulWidget {
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  int selectedLaundary = 0;
  List services = [
    "Wash and Fold",
    "Wash and Iron",
    "DryCleaning",
    "Only Iron",
    "Only Wash",
    "Hand Wash"
  ];

  addressModalsheet() {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                title: Text("Select an address"),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete),
                )),
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      //open map
                      print("tapped");
                    },
                    child: Text("+ Add Address"),
                  )
                ],
              ),
            ),
            Text("Saved Adressess"),
          ],
        ),
      ),
    );
  }

  confirmOrderModalSheet() {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                title: Text("Delivery at abc location"),
                trailing: IconButton(
                  onPressed: () {
                    addressModalsheet();
                  },
                  icon: Icon(Icons.keyboard_arrow_down),
                )),
            Text("Your Items"),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                margin: EdgeInsets.symmetric(vertical: 20 / 2),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Text("Drycleaning"),
                              Text("20 clothes")
                            ],
                          ),
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Text(
                      "Pay after order accepted by shop from the payment section")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Text("You can cancell your order from Order section")),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: RaisedButton(
                color: Colors.blue[600],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Schedule Order",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print("Order has been placed");
                  Navigator.pop(context);

                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(milliseconds: 2000),
                      content: Text("Order has been placed successfully..")));

                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => AddItems()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(var services, var index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.cyanAccent)),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(services[index]),
                Text("Add number of clothes"),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          child: IconButton(
                              icon: Icon(Icons.remove), onPressed: () {})),
                      Container(child: Text("1")),
                      Container(
                          child: IconButton(
                              icon: Icon(Icons.add), onPressed: () {})),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: RaisedButton(
                        color: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: RaisedButton(
                        color: Colors.blue[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text("Add Items and service"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue[900],
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          child: Text(
                            "Select service and add the number of items",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
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
                                  _showMyDialog(services, index);
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
                          })),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: EdgeInsets.symmetric(vertical: 20 / 2),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Card(
                                child: Column(
                                  children: <Widget>[],
                                ),
                              ),
                            );
                          })),
                  Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: Text(
                          "Select pickup day and time",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            padding: EdgeInsets.only(right: 20.0, left: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(14)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: false,
                                onChanged: (val) {},
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Monday"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Tuesday"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Wednesday"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Thursday"),
                                    value: 1,
                                  ),
                                ],
                                hint: Text("Day"),
                                onTap: () {},
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            padding: EdgeInsets.only(right: 20.0, left: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(14)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: false,
                                onChanged: (val) {},
                                items: [
                                  DropdownMenuItem(
                                    child: Text("1 AM"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("2 AM"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("3 AM"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("1 AM"),
                                    value: 1,
                                  ),
                                ],
                                hint: Text("Time"),
                                onTap: () {},
                              ),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        child: Text(
                          "Select delivery day and time",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            padding: EdgeInsets.only(right: 20.0, left: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(14)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: false,
                                onChanged: (val) {},
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Monday"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Tuesday"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Wednesday"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Thursday"),
                                    value: 1,
                                  ),
                                ],
                                hint: Text("Day"),
                                onTap: () {},
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            padding: EdgeInsets.only(right: 20.0, left: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(14)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: false,
                                onChanged: (val) {},
                                items: [
                                  DropdownMenuItem(
                                    child: Text("1 AM"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("2 AM"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("3 AM"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("1 AM"),
                                    value: 1,
                                  ),
                                ],
                                hint: Text("Time"),
                                onTap: () {},
                              ),
                            )),
                      ),
                    ],
                  )
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
                  "Confirm order",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  confirmOrderModalSheet();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
