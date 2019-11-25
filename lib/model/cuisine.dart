class Cuisine {
  int cuisineId;
  String cuisineName;

  Cuisine({
    this.cuisineId,
    this.cuisineName,
  });

  factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
    cuisineId: json["cuisine_id"],
    cuisineName: json["cuisine_name"],
  );

  Map<String, dynamic> toJson() => {
    "cuisine_id": cuisineId,
    "cuisine_name": cuisineName,
  };
}
