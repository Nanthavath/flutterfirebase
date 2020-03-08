import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

//Explicit

final formkey = GlobalKey<FormState>();
String nameString, emailString, passString;

Widget nameText() {
  return TextFormField(
    style: TextStyle(fontSize: 25),
    decoration: InputDecoration(
      icon: Icon(
        Icons.face,
        color: Colors.blue,
        size: 40,
      ),
      labelText: 'Display name:',
      labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
    ),
    validator: (String value) {
      if (value.isEmpty) {
        return 'Please fill your name';
      } else {
        return null;
      }
    },
    onSaved: (String value) {
      nameString = value.trim();
    },
  );
}

Widget emailText() {
  return TextFormField(
    style: TextStyle(fontSize: 25),
    decoration: InputDecoration(
      icon: Icon(
        Icons.email,
        color: Colors.blue,
        size: 40,
      ),
      labelText: 'Email:',
      labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
    ),
    validator: (String value) {
      if (!(value.contains('@') && (value.contains('.')))) {
        return 'Please fill your email in the format youname@yourdomain.com';
      } else {
        return null;
      }
    },onSaved: (String value){
      emailString=value.trim();
    },
  );
}

Widget passwordText() {
  return TextFormField(
    style: TextStyle(fontSize: 25),
    decoration: InputDecoration(
      icon: Icon(
        Icons.lock,
        color: Colors.blue,
        size: 40,
      ),
      labelText: 'Password:',
      labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
    ),
    validator: (String value) {
      if (value.length < 6) {
        return 'Password must 6 charector';
      } else {
        return null;
      }
    },onSaved: (String value){
      passString=value.trim();
    },
  );
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Form(
          key: formkey,
          child: ListView(
            padding: EdgeInsets.all(35),
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
              SizedBox(
                height: 200,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  if (formkey.currentState.validate()) {
                    formkey.currentState.save();

                    print('Name=$nameString \n Email=$emailString \n Password=$passString');
                  }
                },
                child: Text(
                  'Sign Up',
                ),
              )
            ],
          ),
        ));
  }
}
