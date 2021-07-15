import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
        backgroundColor: Colors.white,
      ),
    ));
  }
}

class LoginScreen extends StatefulWidget {
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  Widget build(BuildContext context) {
    return (Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Container(
                  child: Center(
                    child: Text(
                      "Log in with email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email address',
                    hintText: 'Email address'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password (8+ characters) ',
                    hintText: 'Password (8+ characters)'),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "By clicking below, you agree to our ",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Terms of User",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                      recognizer: TapGestureRecognizer()),
                  TextSpan(
                      text: " to our ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                      recognizer: TapGestureRecognizer()),
                ]))),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(30)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()
                        )
                        );
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
