import 'categorie_element.dart';


class CategoryResponse {
  List<CategorieElement> categories;

  CategoryResponse({
    this.categories,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    categories: List<CategorieElement>.from(json["categories"].map((x) => CategorieElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}
