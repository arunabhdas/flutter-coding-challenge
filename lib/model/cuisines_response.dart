import 'cuisine_element.dart';

class CuisinesResponse {
  List<CuisineElement> cuisines;

  CuisinesResponse({
    this.cuisines,
  });

  factory CuisinesResponse.fromJson(Map<String, dynamic> json) => CuisinesResponse(
    cuisines: List<CuisineElement>.from(json["cuisines"].map((x) => CuisineElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cuisines": List<dynamic>.from(cuisines.map((x) => x.toJson())),
  };
}
