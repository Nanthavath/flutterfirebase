import 'package:flutter/material.dart';
import 'package:flutterfirebase/Login/homelogin.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeLogin(),);
  }
}