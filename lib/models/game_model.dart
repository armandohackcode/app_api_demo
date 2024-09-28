// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);

import 'dart:convert';

List<GameModel> gameModelFromJson(String str) =>
    List<GameModel>.from(json.decode(str).map((x) => GameModel.fromJson(x)));

String gameModelToJson(List<GameModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GameModel {
  int id;
  String title;
  String thumbnail;
  String shortDescription;
  String gameUrl;
  String genre;
  String platform;
  String publisher;
  String developer;
  String releaseDate;
  String freetogameProfileUrl;

  GameModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  GameModel copyWith({
    int? id,
    String? title,
    String? thumbnail,
    String? shortDescription,
    String? gameUrl,
    String? genre,
    String? platform,
    String? publisher,
    String? developer,
    String? releaseDate,
    String? freetogameProfileUrl,
  }) =>
      GameModel(
        id: id ?? this.id,
        title: title ?? this.title,
        thumbnail: thumbnail ?? this.thumbnail,
        shortDescription: shortDescription ?? this.shortDescription,
        gameUrl: gameUrl ?? this.gameUrl,
        genre: genre ?? this.genre,
        platform: platform ?? this.platform,
        publisher: publisher ?? this.publisher,
        developer: developer ?? this.developer,
        releaseDate: releaseDate ?? this.releaseDate,
        freetogameProfileUrl: freetogameProfileUrl ?? this.freetogameProfileUrl,
      );

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        shortDescription: json["short_description"],
        gameUrl: json["game_url"],
        genre: json["genre"],
        platform: json["platform"],
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: json["release_date"],
        freetogameProfileUrl: json["freetogame_profile_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "short_description": shortDescription,
        "game_url": gameUrl,
        "genre": genre,
        "platform": platform,
        "publisher": publisher,
        "developer": developer,
        "release_date": releaseDate,
        "freetogame_profile_url": freetogameProfileUrl,
      };
}
