import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/model/cuisine_cuisine.dart';
import 'package:flutter_coding_challenge/model/cuisine_element.dart';
import 'package:http/http.dart';
import 'detailscreen.dart';
import 'package:http/http.dart' show get;
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'model/cuisines_response.dart';
import 'model/cuisine_cuisine.dart';
import 'dart:async';
import 'dart:convert';


class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState () => _MainScreenState();


}

class _MainScreenState extends State<MainScreen> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;
  List<CuisineCuisine> _cuisineList = [];
  String _currentCuisineSelected = "Test";
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
                      items: _cuisineList.map((CuisineCuisine cuisineCuisine) {
                        return new DropdownMenuItem<String>(
                          value: cuisineCuisine.cuisineId.toString(),
                          child: new Text(cuisineCuisine.cuisineName),
                        );
                      }).toList(),

                      onChanged: (String newValueSelected) {
                          setState(() {
                            // TODO-FIXME-DEBUG
                            this._currentCuisineSelected = newValueSelected;
                          });
                      },
                      value: _currentCuisineSelected,
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
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(

                        decoration: InputDecoration(
                          labelText: _currentCuisineSelected,

                    )
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
    // _makeCuisinesRequest();
    _loadCuisineList();
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

  Future<List<CuisineCuisine>> _loadCuisineList() async {
    List<CuisineElement> cuisineElementsList = [];
    List<CuisineCuisine> cuisineList = [];
    var url = 'https://developers.zomato.com/api/v2.1/cuisines?city_id=89';
    Map<String, String> headers = {"user-key": "327e75c31ca03dbb55cbabe4257acfa9", "Accept": "application/json"};
    Response response = await get(url, headers: headers);
    var data = json.decode(response.body);

    var rest = data['cuisines'] as List;

    cuisineElementsList = rest.map<CuisineElement>( (json) => CuisineElement.fromJson(json)).toList();



    for (CuisineElement cui in cuisineElementsList) {
      CuisineCuisine cuisine = CuisineCuisine(cuisineId: cui.cuisine.cuisineId, cuisineName: cui.cuisine.cuisineName);
      cuisineList.add(cuisine);
      // _cuisineList.add(cuisine);
    }

    this.setState(() {
      _cuisineList = cuisineList;
    });

    print(cuisineList.toString());
    return cuisineList;
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


