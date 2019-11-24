import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){

        }),
        title: Text('MainScreen'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {

          },)
        ],
      ),
    );
  }
}

