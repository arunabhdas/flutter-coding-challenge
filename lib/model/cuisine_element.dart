import 'cuisine_cuisine.dart';

class CuisineElement {
  CuisineCuisine cuisine;

  CuisineElement({
    this.cuisine,
  });

  factory CuisineElement.fromJson(Map<String, dynamic> json) => CuisineElement(
    cuisine: CuisineCuisine.fromJson(json["cuisine"]),
  );

  Map<String, dynamic> toJson() => {
    "cuisine": cuisine.toJson(),
  };
}
