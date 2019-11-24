import 'package:flutter/material.dart';
import 'detailscreen.dart';

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
      body: Center(
        child: RaisedButton(
          child: Text('Next Screen-'),
          color: new Color(0xff622f74),
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailScreen()),
            );
          },
        ),
      ),
    );
  }
}

