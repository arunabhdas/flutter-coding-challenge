

class Review {
  List<dynamic> review;

  Review({
    this.review,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    review: List<dynamic>.from(json["review"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "review": List<dynamic>.from(review.map((x) => x)),
  };
}
