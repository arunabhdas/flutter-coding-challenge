

class HasMenuStatus {
  int delivery;
  int takeaway;

  HasMenuStatus({
    this.delivery,
    this.takeaway,
  });

  factory HasMenuStatus.fromJson(Map<String, dynamic> json) => HasMenuStatus(
    delivery: json["delivery"],
    takeaway: json["takeaway"],
  );

  Map<String, dynamic> toJson() => {
    "delivery": delivery,
    "takeaway": takeaway,
  };
}
