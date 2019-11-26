

class Title {
  String text;

  Title({
    this.text,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
  };
}