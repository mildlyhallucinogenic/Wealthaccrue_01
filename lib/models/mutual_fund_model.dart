// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FundModel welcomeFromJson(String str) => FundModel.fromJson(json.decode(str));

String welcomeToJson(FundModel data) => json.encode(data.toJson());

class FundModel {
  FundModel({
    required this.meta,
    required this.data,
    required this.status,
  });

  Meta meta;
  List<Dates> data;
  String status;

  factory FundModel.fromJson(Map<String, dynamic> json) => FundModel(
        meta: Meta.fromJson(json["meta"]),
        data: List<Dates>.from(json["data"].map((x) => Dates.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
      };
}

class Dates {
  Dates({
    required this.date,
    required this.nav,
  });

  String date;
  String nav;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        date: json["date"],
        nav: json["nav"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "nav": nav,
      };
}

class Meta {
  Meta({
    required this.fundHouse,
    required this.schemeType,
    required this.schemeCategory,
    required this.schemeCode,
    required this.schemeName,
  });

  String fundHouse;
  String schemeType;
  String schemeCategory;
  int schemeCode;
  String schemeName;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        fundHouse: json["fund_house"],
        schemeType: json["scheme_type"],
        schemeCategory: json["scheme_category"],
        schemeCode: json["scheme_code"],
        schemeName: json["scheme_name"],
      );

  Map<String, dynamic> toJson() => {
        "fund_house": fundHouse,
        "scheme_type": schemeType,
        "scheme_category": schemeCategory,
        "scheme_code": schemeCode,
        "scheme_name": schemeName,
      };
}
