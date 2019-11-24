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
      ),
      home: MainScreen(),
    );
  }
}

