import 'title.dart';
import 'bg_color.dart';


class RatingObj {
  Title title;
  BgColor bgColor;

  RatingObj({
    this.title,
    this.bgColor,
  });

  factory RatingObj.fromJson(Map<String, dynamic> json) => RatingObj(
    title: Title.fromJson(json["title"]),
    bgColor: BgColor.fromJson(json["bg_color"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title.toJson(),
    "bg_color": bgColor.toJson(),
  };
}