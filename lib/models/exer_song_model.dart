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

  List<SongData> songData;

  factory ExerSongModel.fromJson(Map<String, dynamic> json) => ExerSongModel(
        songData: List<SongData>.from(
            json['song_data'].map((x) => SongData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'song_data': List<dynamic>.from(songData.map((x) => x.toJson())),
      };
}

class SongData {
  SongData({
    this.level,
    this.sheet,
  });

  int level;
  String sheet;

  factory SongData.fromJson(Map<String, dynamic> json) => SongData(
        level: json['level'],
        sheet: json['sheet'],
      );

  Map<String, dynamic> toJson() => {
        'level': level,
        'sheet': sheet,
      };
}
