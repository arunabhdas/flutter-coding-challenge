import 'package:flutter/material.dart';
import 'detailscreen.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState () => _MainScreenState();


}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){

        }),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {

          },)
        ],
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Next Screen'),
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

class TextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        decoration:
        InputDecoration(border: InputBorder.none, hintText: 'Search'),
      ),
    );
  }
}


