import 'foodie_level.dart';
import 'foodie_color.dart';

class User {
  String name;
  FoodieLevel foodieLevel;
  int foodieLevelNum;
  FoodieColor foodieColor;
  String profileUrl;
  String profileImage;
  String profileDeeplink;
  String zomatoHandle;

  User({
    this.name,
    this.foodieLevel,
    this.foodieLevelNum,
    this.foodieColor,
    this.profileUrl,
    this.profileImage,
    this.profileDeeplink,
    this.zomatoHandle,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    foodieLevel: foodieLevelValues.map[json["foodie_level"]],
    foodieLevelNum: json["foodie_level_num"],
    foodieColor: foodieColorValues.map[json["foodie_color"]],
    profileUrl: json["profile_url"],
    profileImage: json["profile_image"],
    profileDeeplink: json["profile_deeplink"],
    zomatoHandle: json["zomato_handle"] == null ? null : json["zomato_handle"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "foodie_level": foodieLevelValues.reverse[foodieLevel],
    "foodie_level_num": foodieLevelNum,
    "foodie_color": foodieColorValues.reverse[foodieColor],
    "profile_url": profileUrl,
    "profile_image": profileImage,
    "profile_deeplink": profileDeeplink,
    "zomato_handle": zomatoHandle == null ? null : zomatoHandle,
  };
}