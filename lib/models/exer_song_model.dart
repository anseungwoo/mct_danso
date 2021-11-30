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

  List<SongData>? songData;

  factory ExerSongModel.fromJson(Map<String, dynamic> json) => ExerSongModel(
        songData: List<SongData>.from(
            json['song_data'].map((x) => SongData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'song_data': List<dynamic>.from(songData!.map((x) => x.toJson())),
      };
}

class SongData {
  SongData({
    this.id,
    this.learnLevel,
    this.learnSheet,
    this.learnPath,
  });

  int? id;
  int? learnLevel;
  String? learnSheet;
  String? learnPath;

  factory SongData.fromJson(Map<String, dynamic> json) => SongData(
        id: json['id'],
        learnLevel: json['learn_level'],
        learnSheet: json['learn_sheet'],
        learnPath: json['learn_path'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'learn_level': learnLevel,
        'learn_sheet': learnSheet,
        'learn_path': learnPath,
      };
}
