import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'detailscreen.dart';
import 'package:http/http.dart' show get;

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
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child:
                    DropdownButton<String>(
                      items: <String>['1', '2', '3', '4'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                ),
                Expanded(
                  child:
                    DropdownButton<String>(
                      items: <String>['1', '2', '3', '4'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                )
              ],
            ),
            Row(
             children: <Widget>[
               Expanded(
                 child: RaisedButton(
                   child: Text('Spin'),
                   color: new Color(0xff622f74),
                   onPressed: () {
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context) => DetailScreen()),
                     );
                   },
                 ),
               ),
             ],
            ),
            Row(
              children: <Widget>[
                Expanded(
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
              ],
            )
          ],
        ),
      ),
    );
  }

  void _makeCuisinesRequest() async {
    var url = 'https://developers.zomato.com/api/v2.1/cuisines?city_id=89';
    Map<String, String> headers = {"user-key": "327e75c31ca03dbb55cbabe4257acfa9"};
    Response response = await get(url, headers: headers);
    print(response.body);
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


