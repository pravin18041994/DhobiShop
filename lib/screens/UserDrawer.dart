import 'package:flutter/material.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: null, accountEmail: null),
            ListTile(
              title: Text("Profile"),
            ),
            ListTile(
              title: Text("Your Orders"),
            ),
            ListTile(
              title: Text("Make Payments"),
            ),
            ListTile(
              title: Text("About"),
            ),
            ListTile(
              title: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
