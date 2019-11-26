import 'restaurant_element.dart';


class RestaurantResponse {
  int resultsFound;
  int resultsStart;
  int resultsShown;
  List<RestaurantElement> restaurants;

  RestaurantResponse({
    this.resultsFound,
    this.resultsStart,
    this.resultsShown,
    this.restaurants,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) => RestaurantResponse(
    resultsFound: json["results_found"],
    resultsStart: json["results_start"],
    resultsShown: json["results_shown"],
    restaurants: List<RestaurantElement>.from(json["restaurants"].map((x) => RestaurantElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results_found": resultsFound,
    "results_start": resultsStart,
    "results_shown": resultsShown,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}
