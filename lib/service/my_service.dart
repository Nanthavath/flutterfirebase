import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/Login/homelogin.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//Explicit

//Method

  Widget signOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app, size: 35),
      tooltip: 'Sign Out',
      onPressed: () {
        myAlert();
      },
    );
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to Sign Out'),
            actions: <Widget>[
              cancelButton(),
              okButton(),
            ],
          );
        });
  }

  Widget cancelButton() {
    return FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Cancel'));
  }

  Widget okButton() {
    return FlatButton(
      onPressed: () {
        Navigator.of(context).pop();
        processSignOut();
      },
      child: Text('OK'),
    );
  }

  Future<void> processSignOut() async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signOut().then((response){
      MaterialPageRoute materialPageRoute=MaterialPageRoute(builder: (BuildContext context)=>HomeLogin());
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> rout)=>false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service'),
        actions: <Widget>[
          signOutButton(),
        ],
      ),
      body: Text('Hello'),
    );
  }
}
