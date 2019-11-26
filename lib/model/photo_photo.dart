import 'user.dart';


class PhotoPhoto {
  String id;
  String url;
  String thumbUrl;
  User user;
  int resId;
  String caption;
  int timestamp;
  String friendlyTime;
  int width;
  int height;

  PhotoPhoto({
    this.id,
    this.url,
    this.thumbUrl,
    this.user,
    this.resId,
    this.caption,
    this.timestamp,
    this.friendlyTime,
    this.width,
    this.height,
  });

  factory PhotoPhoto.fromJson(Map<String, dynamic> json) => PhotoPhoto(
    id: json["id"],
    url: json["url"],
    thumbUrl: json["thumb_url"],
    user: User.fromJson(json["user"]),
    resId: json["res_id"],
    caption: json["caption"],
    timestamp: json["timestamp"],
    friendlyTime: json["friendly_time"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "thumb_url": thumbUrl,
    "user": user.toJson(),
    "res_id": resId,
    "caption": caption,
    "timestamp": timestamp,
    "friendly_time": friendlyTime,
    "width": width,
    "height": height,
  };
}
