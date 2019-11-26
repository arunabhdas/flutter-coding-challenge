import 'package:flutter/material.dart';
import 'model/cuisine_cuisine.dart';
import 'model/cuisine_element.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' show get;

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailScreen'),
      ),
    );
  }


  Future<List<CuisineCuisine>> _loadRestaurantsList() async {
    List<CuisineElement> cuisineElementsList = [];
    List<CuisineCuisine> cuisineList = [];
    var url = 'https://developers.zomato.com/api/v2.1/search?sort=cost&order=asc&category=1&cuisines=1035';
    Map<String, String> headers = {"user-key": "327e75c31ca03dbb55cbabe4257acfa9", "Accept": "application/json"};
    Response response = await get(url, headers: headers);
    var data = json.decode(response.body);

    var rest = data['cuisines'] as List;

    cuisineElementsList = rest.map<CuisineElement>( (json) => CuisineElement.fromJson(json)).toList();



    for (CuisineElement cui in cuisineElementsList) {
      CuisineCuisine cuisine = CuisineCuisine(cuisineId: cui.cuisine.cuisineId, cuisineName: cui.cuisine.cuisineName);
      cuisineList.add(cuisine);
    }


    return cuisineList;
  }

}
