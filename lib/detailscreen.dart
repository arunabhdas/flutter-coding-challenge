import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/model/restaurant_restaurant.dart';
import 'model/cuisine_cuisine.dart';
import 'model/cuisine_element.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' show get;
import 'model/restaurant_restaurant.dart';

class DetailScreen extends StatefulWidget {
  @override
  State createState() => new DyanmicList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailScreen'),
      ),
    );
  }


}

class DyanmicList extends State<DetailScreen> {
  List<String> litems = [];
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('DetailScreen'),
      ),
    );
  }
}