import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/MainScreen.dart';
import 'package:flutter_app/screens/TransactionScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FHome Finance Manager",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.indigo,
          accentColor: Colors.lightBlue,
          fontFamily: 'Georgia'),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => MainScreen(),
        '/transaction': (BuildContext context) => TransactionScreen()
      },
      supportedLocales: [const Locale('ru', ''), const Locale('en', '')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }
}
