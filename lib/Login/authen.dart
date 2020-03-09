import 'package:flutter/material.dart';
import 'package:flutterfirebase/Login/homelogin.dart';
import 'package:flutterfirebase/Login/signup.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
//Explicit
//Method

  Widget backButton() {
    return IconButton(
        icon: Icon(
          Icons.navigate_before,
          size: 40,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  Widget content() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          showAppname(),
          emailText(),
          passwordText(),
        ],
      ),
    );
  }

  Widget showAppname() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        showLogo(),
        SizedBox(
          width: 5,
        ),
        showText(),
      ],
    );
  }

  Widget showLogo() {
    return Container(
      width: 48,
      height: 48,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showText() {
    return Text('Fit function');
  }

  Widget emailText() {
    return Container(
      width: 300,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: 'Email',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 300,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: 'Password',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            backButton(),
            content(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
