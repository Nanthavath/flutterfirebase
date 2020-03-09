import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/Login/homelogin.dart';
import 'package:flutterfirebase/Login/signup.dart';
import 'package:flutterfirebase/service/my_service.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
//Explicit

  final formKey = GlobalKey<FormState>();
  String emailString, passwordString;

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
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showAppname(),
            emailText(),
            passwordText(),
          ],
        ),
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
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: 'Email',
        ),
        onSaved: (String value) {
          emailString = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 300,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: 'Password',
        ),
        onSaved: (String value) {
          passwordString = value;
        },
      ),
    );
  }

  Future<void> checkAuthen() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((response) {
      print('Login Success');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> rout) => false);
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      myAlert(title, message);
    });
  }

  void myAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: ListTile(
            leading: Icon(
              Icons.add_alert,
              color: Colors.red,
              size: 40,
            ),
            title: Text(
              title,
              style: TextStyle(color: Colors.red),
            ),
          ),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'))
          ],
        );
      },
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
        onPressed: () {
          formKey.currentState.save();
          print('email=$emailString password=$passwordString');
          checkAuthen();
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
