// To parse this JSON data, do
//
//     final exerSongModel = exerSongModelFromJson(jsonString);

import 'dart:convert';

ExerSongModel exerSongModelFromJson(String str) =>
    ExerSongModel.fromJson(json.decode(str));

String exerSongModelToJson(ExerSongModel data) => json.encode(data.toJson());

class ExerSongModel {
  ExerSongModel({
    this.songData,
  });

  List<SongDatum> songData;

  factory ExerSongModel.fromJson(Map<String, dynamic> json) => ExerSongModel(
        songData: List<SongDatum>.from(
            json["song_data"].map((x) => SongDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "song_data": List<dynamic>.from(songData.map((x) => x.toJson())),
      };
}

class SongDatum {
  SongDatum({
    this.learnLevel,
    this.learnSheet,
    this.learnPath,
  });

  int learnLevel;
  String learnSheet;
  String learnPath;

  factory SongDatum.fromJson(Map<String, dynamic> json) => SongDatum(
        learnLevel: json["learn_level"],
        learnSheet: json["learn_sheet"],
        learnPath: json["learn_path"],
      );

  Map<String, dynamic> toJson() => {
        "learn_level": learnLevel,
        "learn_sheet": learnSheet,
        "learn_path": learnPath,
      };
}
