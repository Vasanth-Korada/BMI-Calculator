import 'package:flutter/material.dart';
import './ui/BMI.dart';
import './ui/splashscreen.dart';
import 'dart:async';


void main() {
  runApp(new MaterialApp(
    title: "BMI-Calculator",
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new BMI()
    },
  ));
}
