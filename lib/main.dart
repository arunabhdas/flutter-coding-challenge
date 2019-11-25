import 'package:flutter/material.dart';
import 'mainscreen.dart';

void main() {
  return runApp(SuburbanSpoon());
}

class SuburbanSpoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'SuburbanSpoon',
        theme: ThemeData(
        primaryColor: new Color(0xff622f74),
        scaffoldBackgroundColor: Color(0XFF212845),
        primarySwatch: Colors.yellow,
        buttonColor: Color(0XFFF8D320),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
        unselectedWidgetColor: Colors.white,
        textSelectionColor: Colors.white,
        accentColor: Colors.green,
      ),
      home: MainScreen(),
    );
  }
}

