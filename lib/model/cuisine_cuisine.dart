class CuisineCuisine {
  int cuisineId;
  String cuisineName;

  CuisineCuisine({
    this.cuisineId,
    this.cuisineName,
  });

  factory CuisineCuisine.fromJson(Map<String, dynamic> json) => CuisineCuisine(
    cuisineId: json["cuisine_id"],
    cuisineName: json["cuisine_name"],
  );

  Map<String, dynamic> toJson() => {
    "cuisine_id": cuisineId,
    "cuisine_name": cuisineName,
  };
}
