import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_washer/bloc/SignupBloc.dart';
import 'package:real_washer/screens/LoginPage.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 160,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('Images/laundaryimg1.jpg'),
                      ),
                    ),
                    Positioned(
                        left: 190,
                        top: 80,
                        child: IconButton(
                          iconSize: 40,
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.red,
                          ),
                        ))
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 40,
                        child: TextField(
                          // onChanged: signupBloc.getUserName,
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              labelText: "Name",
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide()),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide()),
                              suffixIcon: Icon(Icons.face),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide())),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          // onChanged: signupBloc.getUserEmail,
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide()),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide()),
                              suffixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide())),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          // onChanged: signupBloc.getUserContactNumber,
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              labelText: "Contact Number",
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide()),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide()),
                              suffixIcon: Icon(Icons.smartphone),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide())),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          // onChanged: signupBloc.getUserPassword,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide()),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide()),
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.visibility_off),
                                  onPressed: () {}),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide())),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.grey)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    child: Text("SignUp"),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: Divider(
                          color: Colors.black,
                          thickness: 2.0,
                        ),
                      ),
                      Text("or signup using"),
                      Container(
                        width: 100,
                        child: Divider(
                          color: Colors.black,
                          thickness: 2.0,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                        onPressed: () {}),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
