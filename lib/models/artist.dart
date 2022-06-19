import 'dart:convert';

List<Artist> artistFromJson(String str) =>
    List<Artist>.from(json.decode(str).map((x) => Artist.fromJson(x)));

String artistToJson(List<Artist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Artist {
  Artist({
    required this.name,
    required this.id,
    required this.bio,
    required this.rating,
    required this.noOfServiceCompleted,
    required this.picture,
  });

  String name;
  int id;
  String bio;
  int rating;
  int noOfServiceCompleted;
  String picture;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
        id: json["id"],
        bio: json["bio"],
        rating: json["rating"],
        noOfServiceCompleted: json["noOfServiceCompleted"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "bio": bio,
        "rating": rating,
        "noOfServiceCompleted": noOfServiceCompleted,
        "picture": picture,
      };
}
