import 'rating_text.dart';
import 'rating_color.dart';
import 'rating_obj.dart';

class UserRating {
  String aggregateRating;
  RatingText ratingText;
  RatingColor ratingColor;
  RatingObj ratingObj;
  String votes;

  UserRating({
    this.aggregateRating,
    this.ratingText,
    this.ratingColor,
    this.ratingObj,
    this.votes,
  });

  factory UserRating.fromJson(Map<String, dynamic> json) => UserRating(
    aggregateRating: json["aggregate_rating"],
    ratingText: ratingTextValues.map[json["rating_text"]],
    ratingColor: ratingColorValues.map[json["rating_color"]],
    ratingObj: RatingObj.fromJson(json["rating_obj"]),
    votes: json["votes"],
  );

  Map<String, dynamic> toJson() => {
    "aggregate_rating": aggregateRating,
    "rating_text": ratingTextValues.reverse[ratingText],
    "rating_color": ratingColorValues.reverse[ratingColor],
    "rating_obj": ratingObj.toJson(),
    "votes": votes,
  };
}