import 'photo_photo.dart';

class PhotoElement {
  PhotoPhoto photo;

  PhotoElement({
    this.photo,
  });

  factory PhotoElement.fromJson(Map<String, dynamic> json) => PhotoElement(
    photo: PhotoPhoto.fromJson(json["photo"]),
  );

  Map<String, dynamic> toJson() => {
    "photo": photo.toJson(),
  };
}