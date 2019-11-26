import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/model/restaurant_element.dart';
import 'package:flutter_coding_challenge/model/restaurant_restaurant.dart';
import 'model/cuisine_cuisine.dart';
import 'model/cuisine_element.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' show get;
import 'model/restaurant_restaurant.dart';

class DetailScreen extends StatefulWidget {
  String catId;
  String cuisId;
  DetailScreen({this.catId, this.cuisId});
  @override
  State createState() => new DyanmicList();


}

class DyanmicList extends State<DetailScreen> {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('DetailScreen'),
      ),
      body: Container(
        color: Colors.indigo,
        child: FutureBuilder(
          future: _loadRestaurantList(widget.catId, widget.cuisId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          /*
                          backgroundImage: NetworkImage(
                            snapshot.data[index].thumb
                          ),*/
                        ),
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(snapshot.data[index].location.address),
                        onTap: () {
                          // do something
                        },
                        onLongPress: (){
                          // do something else
                        },
                      ),
                    );
                  }
              );
            } else {
                return Container(
                  child: Center(
                    child: Text("Loading"),
                  ),
                );
            }
          },
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    // _loadRestaurantList("1", "1035");
    // _loadRestaurantList(widget.catId, widget.cuisId);
  }


  Future<List<RestaurantRestaurant>> _loadRestaurantList(String categoryId, String cuisineId) async {
    List<RestaurantElement> restaurantElementsList = [];
    List<RestaurantRestaurant> restaurantList = [];
    var url = 'https://developers.zomato.com/api/v2.1/search?sort=cost&order=asc&category=$categoryId&cuisines=$cuisineId';
    print(url);
    Map<String, String> headers = {"user-key": "327e75c31ca03dbb55cbabe4257acfa9", "Accept": "application/json"};
    Response response = await get(url, headers: headers);
    var data = json.decode(response.body);

    var rest = data['restaurants'] as List;

    restaurantElementsList = rest.map<RestaurantElement>( (json) => RestaurantElement.fromJson(json)).toList();



    for (RestaurantElement res in restaurantElementsList) {
      RestaurantRestaurant restaurant = RestaurantRestaurant(
                                                              r: res.restaurant.r,
                                                              apikey: res.restaurant.apikey,
                                                              id: res.restaurant.id,
                                                              name: res.restaurant.name,
                                                              url: res.restaurant.url,
                                                              location: res.restaurant.location,
                                                              switchToOrderMenu: res.restaurant.switchToOrderMenu,
                                                              cuisines: res.restaurant.cuisines,
                                                              timings: res.restaurant.timings,
                                                              averageCostForTwo: res.restaurant.averageCostForTwo,
                                                              priceRange: res.restaurant.priceRange,
                                                              currency: res.restaurant.currency,
                                                              highlights: res.restaurant.highlights,
                                                              offers: res.restaurant.offers,
                                                              opentableSupport: res.restaurant.opentableSupport,
                                                              isZomatoBookRes: res.restaurant.isZomatoBookRes,
                                                              mezzoProvider: res.restaurant.mezzoProvider,
                                                              isBookFormWebView: res.restaurant.isBookFormWebView,
                                                              bookFormWebViewUrl: res.restaurant.bookFormWebViewUrl,
                                                              bookAgainUrl: res.restaurant.bookAgainUrl,
                                                              thumb: res.restaurant.thumb,
                                                              userRating: res.restaurant.userRating,
                                                              allReviewsCount: res.restaurant.allReviewsCount,
                                                              photosUrl: res.restaurant.photosUrl,
                                                              photoCount: res.restaurant.photoCount,
                                                              menuUrl: res.restaurant.menuUrl,
                                                              featuredImage: res.restaurant.featuredImage,
                                                              hasOnlineDelivery: res.restaurant.hasOnlineDelivery,
                                                              isDeliveringNow: res.restaurant.isDeliveringNow,
                                                              includeBogoOffers: res.restaurant.includeBogoOffers,
                                                              deeplink: res.restaurant.deeplink,
                                                              isTableReservationSupported: res.restaurant.isTableReservationSupported,
                                                              hasTableBooking: res.restaurant.hasTableBooking,
                                                              eventsUrl: res.restaurant.eventsUrl,
                                                              phoneNumbers: res.restaurant.phoneNumbers,
                                                              allReviews: res.restaurant.allReviews,
                                                              establishment: res.restaurant.establishment,
                                                              establishmentTypes: res.restaurant.establishmentTypes,
                                                            );
      print("------------------");
      print(restaurant.name);
      restaurantList.add(restaurant);
    }


    return restaurantList;
  }

}