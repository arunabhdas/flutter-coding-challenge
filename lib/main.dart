import 'package:flutter/material.dart';
import 'mainscreen.dart';

void main() {
  return runApp(SuburbanSpoon());
}

class SuburbanSpoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SuburbanSpoon',
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

