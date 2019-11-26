
import 'has_menu_status.dart';

class R {
  HasMenuStatus hasMenuStatus;
  int resId;

  R({
    this.hasMenuStatus,
    this.resId,
  });

  factory R.fromJson(Map<String, dynamic> json) => R(
    hasMenuStatus: HasMenuStatus.fromJson(json["has_menu_status"]),
    resId: json["res_id"],
  );

  Map<String, dynamic> toJson() => {
    "has_menu_status": hasMenuStatus.toJson(),
    "res_id": resId,
  };
}
