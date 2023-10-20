// To parse this JSON data, do
//
//     final matchResponseModel = matchResponseModelFromJson(jsonString);

import 'dart:convert';

MatchResponseModel matchResponseModelFromJson(String str) => MatchResponseModel.fromJson(json.decode(str));

String matchResponseModelToJson(MatchResponseModel data) => json.encode(data.toJson());

class MatchResponseModel {
  String? apikey;
  List<Datum>? data;
  String? status;
  Info? info;

  MatchResponseModel({
    this.apikey,
    this.data,
    this.status,
    this.info,
  });

  factory MatchResponseModel.fromJson(Map<String, dynamic> json) => MatchResponseModel(
    apikey: json["apikey"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    status: json["status"],
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "apikey": apikey,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
    "info": info?.toJson(),
  };
}

class Datum {
  String? id;
  String? name;
  MatchType? matchType;
  String? status;
  String? venue;
  DateTime? date;
  DateTime? dateTimeGmt;
  List<String>? teams;
  List<TeamInfo>? teamInfo;
  List<Score>? score;
  String? seriesId;
  bool? fantasyEnabled;
  bool? bbbEnabled;
  bool? hasSquad;
  bool? matchStarted;
  bool? matchEnded;

  Datum({
    this.id,
    this.name,
    this.matchType,
    this.status,
    this.venue,
    this.date,
    this.dateTimeGmt,
    this.teams,
    this.teamInfo,
    this.score,
    this.seriesId,
    this.fantasyEnabled,
    this.bbbEnabled,
    this.hasSquad,
    this.matchStarted,
    this.matchEnded,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    matchType: matchTypeValues.map[json["matchType"]]!,
    status: json["status"],
    venue: json["venue"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateTimeGmt: json["dateTimeGMT"] == null ? null : DateTime.parse(json["dateTimeGMT"]),
    teams: json["teams"] == null ? [] : List<String>.from(json["teams"]!.map((x) => x)),
    teamInfo: json["teamInfo"] == null ? [] : List<TeamInfo>.from(json["teamInfo"]!.map((x) => TeamInfo.fromJson(x))),
    score: json["score"] == null ? [] : List<Score>.from(json["score"]!.map((x) => Score.fromJson(x))),
    seriesId: json["series_id"],
    fantasyEnabled: json["fantasyEnabled"],
    bbbEnabled: json["bbbEnabled"],
    hasSquad: json["hasSquad"],
    matchStarted: json["matchStarted"],
    matchEnded: json["matchEnded"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "matchType": matchTypeValues.reverse[matchType],
    "status": status,
    "venue": venue,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "dateTimeGMT": dateTimeGmt?.toIso8601String(),
    "teams": teams == null ? [] : List<dynamic>.from(teams!.map((x) => x)),
    "teamInfo": teamInfo == null ? [] : List<dynamic>.from(teamInfo!.map((x) => x.toJson())),
    "score": score == null ? [] : List<dynamic>.from(score!.map((x) => x.toJson())),
    "series_id": seriesId,
    "fantasyEnabled": fantasyEnabled,
    "bbbEnabled": bbbEnabled,
    "hasSquad": hasSquad,
    "matchStarted": matchStarted,
    "matchEnded": matchEnded,
  };
}

enum MatchType {
  ODI,
  T20
}

final matchTypeValues = EnumValues({
  "odi": MatchType.ODI,
  "t20": MatchType.T20
});

class Score {
  int? r;
  int? w;
  double? o;
  String? inning;

  Score({
    this.r,
    this.w,
    this.o,
    this.inning,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    r: json["r"],
    w: json["w"],
    o: json["o"]?.toDouble(),
    inning: json["inning"],
  );

  Map<String, dynamic> toJson() => {
    "r": r,
    "w": w,
    "o": o,
    "inning": inning,
  };
}

class TeamInfo {
  String? name;
  String? shortname;
  String? img;

  TeamInfo({
    this.name,
    this.shortname,
    this.img,
  });

  factory TeamInfo.fromJson(Map<String, dynamic> json) => TeamInfo(
    name: json["name"],
    shortname: json["shortname"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "shortname": shortname,
    "img": img,
  };
}

class Info {
  int? hitsToday;
  int? hitsUsed;
  int? hitsLimit;
  int? credits;
  int? server;
  int? offsetRows;
  int? totalRows;
  double? queryTime;
  int? s;
  int? cache;

  Info({
    this.hitsToday,
    this.hitsUsed,
    this.hitsLimit,
    this.credits,
    this.server,
    this.offsetRows,
    this.totalRows,
    this.queryTime,
    this.s,
    this.cache,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    hitsToday: json["hitsToday"],
    hitsUsed: json["hitsUsed"],
    hitsLimit: json["hitsLimit"],
    credits: json["credits"],
    server: json["server"],
    offsetRows: json["offsetRows"],
    totalRows: json["totalRows"],
    queryTime: json["queryTime"]?.toDouble(),
    s: json["s"],
    cache: json["cache"],
  );

  Map<String, dynamic> toJson() => {
    "hitsToday": hitsToday,
    "hitsUsed": hitsUsed,
    "hitsLimit": hitsLimit,
    "credits": credits,
    "server": server,
    "offsetRows": offsetRows,
    "totalRows": totalRows,
    "queryTime": queryTime,
    "s": s,
    "cache": cache,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
