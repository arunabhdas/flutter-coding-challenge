import 'cuisine.dart';


class CuisinesResponse {
  List<Cuisine> cuisines;

  CuisinesResponse({
    this.cuisines,
  });

  factory CuisinesResponse.fromJson(Map<String, dynamic> json) => CuisinesResponse(
    cuisines: List<Cuisine>.from(json["cuisines"].map((x) => Cuisine.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cuisines": List<dynamic>.from(cuisines.map((x) => x.toJson())),
  };
}



