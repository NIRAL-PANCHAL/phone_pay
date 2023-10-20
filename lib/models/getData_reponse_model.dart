// To parse this JSON data, do
//
//     final ffffResponseModel = ffffResponseModelFromJson(jsonString);

import 'dart:convert';

FfffResponseModel ffffResponseModelFromJson(String str) => FfffResponseModel.fromJson(json.decode(str));

String ffffResponseModelToJson(FfffResponseModel data) => json.encode(data.toJson());

class FfffResponseModel {
  List<Dataam>? data;

  FfffResponseModel({
    this.data,
  });

  factory FfffResponseModel.fromJson(Map<String, dynamic> json) => FfffResponseModel(
    data: json["data"] == null ? [] : List<Dataam>.from(json["data"]!.map((x) => Dataam.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Dataam {
  String? userImage;
  String? username;
  List<Media>? media;

  Dataam({
    this.userImage,
    this.username,
    this.media,
  });

  factory Dataam.fromJson(Map<String, dynamic> json) => Dataam(
    userImage: json["UserImage"],
    username: json["Username"],
    media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "UserImage": userImage,
    "Username": username,
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

class Media {
  String? type;
  String? url;

  Media({
    this.type,
    this.url,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    type: json["type"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "url": url,
  };
}
