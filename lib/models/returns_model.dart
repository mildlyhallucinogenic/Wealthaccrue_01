// To parse this JSON data, do
//
//     final returns = returnsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Returns returnsFromJson(String str) => Returns.fromJson(json.decode(str));

String returnsToJson(Returns data) => json.encode(data.toJson());

class Returns {
  Returns({
    required this.success,
    required this.errors,
    required this.data,
  });

  bool success;
  dynamic errors;
  Data data;

  factory Returns.fromJson(Map<String, dynamic> json) => Returns(
        success: json["success"],
        errors: json["errors"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "errors": errors,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.smallcase,
    required this.benchmark,
    required this.durations,
    required this.defaultDuration,
  });

  Smallcase smallcase;
  Benchmark benchmark;
  List<String> durations;
  String defaultDuration;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        smallcase: Smallcase.fromJson(json["smallcase"]),
        benchmark: Benchmark.fromJson(json["benchmark"]),
        durations: List<String>.from(json["durations"].map((x) => x)),
        defaultDuration: json["defaultDuration"],
      );

  Map<String, dynamic> toJson() => {
        "smallcase": smallcase.toJson(),
        "benchmark": benchmark.toJson(),
        "durations": List<dynamic>.from(durations.map((x) => x)),
        "defaultDuration": defaultDuration,
      };
}

class Benchmark {
  Benchmark({
    required this.benchmarkId,
    required this.benchmarkLabel,
    required this.points,
  });

  String benchmarkId;
  String benchmarkLabel;
  List<Point> points;

  factory Benchmark.fromJson(Map<String, dynamic> json) => Benchmark(
        benchmarkId: json["benchmarkId"],
        benchmarkLabel: json["benchmarkLabel"],
        points: List<Point>.from(json["points"].map((x) => Point.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "benchmarkId": benchmarkId,
        "benchmarkLabel": benchmarkLabel,
        "points": List<dynamic>.from(points.map((x) => x.toJson())),
      };
}

class Point {
  Point({
    required this.date,
    required this.value,
  });

  DateTime date;
  double value;

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        date: DateTime.parse(json["date"]),
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "value": value,
      };
}

class Smallcase {
  Smallcase({
    required this.scid,
    required this.points,
  });

  String scid;
  List<Point> points;

  factory Smallcase.fromJson(Map<String, dynamic> json) => Smallcase(
        scid: json["scid"],
        points: List<Point>.from(json["points"].map((x) => Point.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "scid": scid,
        "points": List<dynamic>.from(points.map((x) => x.toJson())),
      };
  
}
