import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'detailscreen.dart';
import 'package:http/http.dart' show get;
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'model/cuisines_response.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState () => _MainScreenState();


}

class _MainScreenState extends State<MainScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: new TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: _currentAddress,
            labelStyle: new TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.search),
          ),
        ),
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){

        }),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            _getCurrentLocation();
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

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _makeCuisinesRequest();
  }

  void _makeCuisinesRequest() async {
    var url = 'https://developers.zomato.com/api/v2.1/cuisines?city_id=89';
    Map<String, String> headers = {"user-key": "327e75c31ca03dbb55cbabe4257acfa9"};
    Response response = await get(url, headers: headers);

    print(response.body);
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        if (_currentPosition != null) {
          print(_currentPosition.latitude);
          print(_currentPosition.longitude);
          print('Location search was completed');
        }
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
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


