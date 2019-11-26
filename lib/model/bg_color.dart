import 'enum_values.dart';


class BgColor {
  Type type;
  String tint;

  BgColor({
    this.type,
    this.tint,
  });

  factory BgColor.fromJson(Map<String, dynamic> json) => BgColor(
    type: typeValues.map[json["type"]],
    tint: json["tint"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "tint": tint,
  };
}

final typeValues = EnumValues({
  "lime": Type.LIME
});



enum Type { LIME }