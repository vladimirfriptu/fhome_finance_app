import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/MainScreen.dart';

class AppRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FHome Finance Manager",
      home: MainScreen(),
    );
  }
}