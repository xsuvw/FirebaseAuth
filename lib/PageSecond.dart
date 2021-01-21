import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';

void main(){
  runApp(MaterialApp(
    home: PageSecond(),
  ));
}

class PageSecond extends StatefulWidget {
  @override
  _PageSecondState createState() => _PageSecondState();
}

class _PageSecondState extends State<PageSecond> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          child: FutureBuilder(
              future: FirebaseAuth.instance.currentUser(),
              builder: (BuildContext context, AsyncSnapshot user) {
                if (user.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Welcome ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        user.data.toString() + "!",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      )
                    ],
                  );
                }
              })),
    );
  }
}