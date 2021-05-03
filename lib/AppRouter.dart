import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/MainScreen.dart';
import 'package:flutter_app/screens/TransactionScreen.dart';

class AppRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FHome Finance Manager",
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainScreen(),
        '/transaction': (BuildContext context) => TransactionScreen()
      },
    );
  }
}