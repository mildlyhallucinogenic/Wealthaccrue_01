// To parse this JSON data, do
//
//     final smallcaseDb = smallcaseDbFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SmallcaseDb smallcaseDbFromJson(String str) => SmallcaseDb.fromJson(json.decode(str));

String smallcaseDbToJson(SmallcaseDb data) => json.encode(data.toJson());

class SmallcaseDb {
    SmallcaseDb({
        required this.idno,
        required this.scid,
        required this.name,
        required this.version,
        required this.shortDescription,
        required this.type,
        required this.publisherName,
        required this.rebalanceSchedule,
        required this.lastRebalanced,
        required this.imageUrl,
        required this.daily,
        required this.weekly,
        required this.monthly,
        required this.quarterly,
        required this.halfyearly,
        required this.yearly,
        required this.threeYear,
        required this.fiveYear,
        required this.sinceInception,
        required this.minInvestAmount,
        required this.divYield,
        required this.smallCapPercentage,
        required this.midCapPercentage,
        required this.largeCapPercentage,
        required this.sharpeRatio,
        required this.cagr,
        required this.pe,
        required this.riskLabel,
        required this.minSipAmount,
        required this.benchmarkId,
        required this.benchamarkIndex,
        required this.benchmarkLabel,
    });

    String idno;
    String scid;
    String name;
    int version;
    String shortDescription;
    String type;
    String publisherName;
    String rebalanceSchedule;
    String lastRebalanced;
    String imageUrl;
    double daily;
    double weekly;
    double monthly;
    double quarterly;
    double halfyearly;
    double yearly;
    double threeYear;
    double fiveYear;
    double sinceInception;
    int minInvestAmount;
    double divYield;
    double smallCapPercentage;
    double midCapPercentage;
    double largeCapPercentage;
    double sharpeRatio;
    double cagr;
    double pe;
    String riskLabel;
    int minSipAmount;
    String benchmarkId;
    String benchamarkIndex;
    String benchmarkLabel;

    factory SmallcaseDb.fromJson(Map<String, dynamic> json) => SmallcaseDb(
        idno: json["idno"],
        scid: json["scid"],
        name: json["name"],
        version: json["version"],
        shortDescription: json["shortDescription"],
        type: json["type"],
        publisherName: json["publisherName"],
        rebalanceSchedule: json["rebalanceSchedule"],
        lastRebalanced: json["lastRebalanced"],
        imageUrl: json["imageUrl"],
        daily: json["daily"].toDouble(),
        weekly: json["weekly"].toDouble(),
        monthly: json["monthly"].toDouble(),
        quarterly: json["quarterly"].toDouble(),
        halfyearly: json["halfyearly"].toDouble(),
        yearly: json["yearly"].toDouble(),
        threeYear: json["threeYear"].toDouble(),
        fiveYear: json["fiveYear"].toDouble(),
        sinceInception: json["sinceInception"].toDouble(),
        minInvestAmount: json["minInvestAmount"],
        divYield: json["divYield"].toDouble(),
        smallCapPercentage: json["smallCapPercentage"].toDouble(),
        midCapPercentage: json["midCapPercentage"].toDouble(),
        largeCapPercentage: json["largeCapPercentage"].toDouble(),
        sharpeRatio: json["sharpeRatio"].toDouble(),
        cagr: json["cagr"].toDouble(),
        pe: json["pe"].toDouble(),
        riskLabel: json["riskLabel"],
        minSipAmount: json["minSipAmount"],
        benchmarkId: json["benchmarkId"],
        benchamarkIndex: json["benchamarkIndex"],
        benchmarkLabel: json["benchmarkLabel"],
    );

    Map<String, dynamic> toJson() => {
        "idno": idno,
        "scid": scid,
        "name": name,
        "version": version,
        "shortDescription": shortDescription,
        "type": type,
        "publisherName": publisherName,
        "rebalanceSchedule": rebalanceSchedule,
        "lastRebalanced": lastRebalanced.toString(),
        "imageUrl": imageUrl,
        "daily": daily,
        "weekly": weekly,
        "monthly": monthly,
        "quarterly": quarterly,
        "halfyearly": halfyearly,
        "yearly": yearly,
        "threeYear": threeYear,
        "fiveYear": fiveYear,
        "sinceInception": sinceInception,
        "minInvestAmount": minInvestAmount,
        "divYield": divYield,
        "smallCapPercentage": smallCapPercentage,
        "midCapPercentage": midCapPercentage,
        "largeCapPercentage": largeCapPercentage,
        "sharpeRatio": sharpeRatio,
        "cagr": cagr,
        "pe": pe,
        "riskLabel": riskLabel,
        "minSipAmount": minSipAmount,
        "benchmarkId": benchmarkId,
        "benchamarkIndex": benchamarkIndex,
        "benchmarkLabel": benchmarkLabel,
    };
}
