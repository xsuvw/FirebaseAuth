import 'package:auth2/widgets/CustomTextWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'PageSecond.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AuthPage()));
}

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Form(
          key: _formKey,
          // ignore: deprecated_member_use
          autovalidate: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                icon: Icon(Icons.email),
                hint: 'Email',
                obsecure: false,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              CustomTextField(
                icon: Icon(Icons.lock),
                hint: 'Password',
                obsecure: true,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              RaisedButton(
                highlightElevation: 0.0,
                splashColor: Colors.white,
                highlightColor: Colors.lightBlue[300],
                elevation: 0.0,
                color: Colors.lightBlue[300],
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text(
                  "login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                onPressed: () {
                  FireAuth();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageSecond()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> FireAuth() async {
  FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'aman', password: 'aman')) as FirebaseUser;
}
