// To parse this JSON data, do
//
//     final songFromJson = songFromJsonFromJson(jsonString);

import 'dart:convert';

SongFromJson songFromJsonFromJson(String str) =>
    SongFromJson.fromJson(json.decode(str));

class SongFromJson {
  SongFromJson({
    this.songData,
  });

  List<SongDataModel> songData;

  factory SongFromJson.fromJson(Map<String, dynamic> json) => SongFromJson(
        songData: List<SongDataModel>.from(
            json['song_data'].map((x) => SongDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'song_data': List<dynamic>.from(songData.map((x) => x.toJson())),
      };
}

class SongDataModel {
  SongDataModel({
    this.songId,
    this.songTitle,
    this.songPath,
    this.songJangdan,
    this.songLike,
    this.songDiff,
    this.songSheet,
  });

  int songId;
  String songTitle;
  String songPath;
  String songJangdan;
  String songLike;
  int songDiff;
  String songSheet;

  factory SongDataModel.fromJson(Map<String, dynamic> json) => SongDataModel(
        songId: json['song_id'],
        songTitle: json['song_title'],
        songPath: json['song_path'],
        songJangdan: json['song_jangdan'],
        songLike: json['song_like'],
        songDiff: json['song_diff'],
        songSheet: json['song_sheet'],
      );

  Map<String, dynamic> toJson() => {
        'song_id': songId,
        'song_title': songTitle,
        'song_path': songPath,
        'song_jangdan': songJangdan,
        'song_like': songLike,
        'song_diff': songDiff,
        'song_sheet': songSheet,
      };
}
