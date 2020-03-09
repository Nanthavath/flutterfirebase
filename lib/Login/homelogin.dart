import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/Login/authen.dart';
import 'package:flutterfirebase/Login/signup.dart';
import 'package:flutterfirebase/service/my_service.dart';

class HomeLogin extends StatefulWidget {
  @override
  _HomeLoginState createState() => _HomeLoginState();
}

Widget showLogo() {
  return Container(
      width: 200, height: 200, child: Image.asset('images/logo.png'));
}

Widget appName() {
  return Text(
    'Fit Function',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  );
}

class _HomeLoginState extends State<HomeLogin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showLogo(),
            SizedBox(
              height: 30,
            ),
            appName(),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => Authen());
                      Navigator.of(context).push(materialPageRoute);
                    },
                    child: Text('Sign In'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RaisedButton(
                    onPressed: () {
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => SignUp());
                      Navigator.of(context).push(materialPageRoute);
                    },
                    child: Text('Sign Up'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
