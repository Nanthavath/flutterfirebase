import 'package:flutter/material.dart';
import 'package:flutterfirebase/Login/signup.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showLogo(),
            appName(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    child: Text('Sign In'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  RaisedButton(
                    onPressed: () {
                      MaterialPageRoute materialPageRoute=MaterialPageRoute(builder: (BuildContext context)=>SignUp());
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
