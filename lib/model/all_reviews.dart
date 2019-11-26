import 'review.dart';


class AllReviews {
  List<Review> reviews;

  AllReviews({
    this.reviews,
  });

  factory AllReviews.fromJson(Map<String, dynamic> json) => AllReviews(
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
  };
}
