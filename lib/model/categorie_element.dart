import 'categorie.dart';

class CategorieElement {
  Categorie categories;

  CategorieElement({
    this.categories,
  });

  factory CategorieElement.fromJson(Map<String, dynamic> json) => CategorieElement(
    categories: Categorie.fromJson(json["categories"]),
  );

  Map<String, dynamic> toJson() => {
    "categories": categories.toJson(),
  };
}
