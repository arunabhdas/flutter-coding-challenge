import 'restaurant_restaurant.dart';


class RestaurantElement {
  RestaurantRestaurant restaurant;

  RestaurantElement({
    this.restaurant,
  });

  factory RestaurantElement.fromJson(Map<String, dynamic> json) => RestaurantElement(
    restaurant: RestaurantRestaurant.fromJson(json["restaurant"]),
  );

  Map<String, dynamic> toJson() => {
    "restaurant": restaurant.toJson(),
  };
}
