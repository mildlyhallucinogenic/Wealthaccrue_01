// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'smallcase_model.g.dart';

SmallcaseModel modelFromJson(String str) =>
    SmallcaseModel.fromJson(json.decode(str));

String modelToJson(SmallcaseModel data) => json.encode(data.toJson());

class SmallcaseModel {
  bool? success;
  dynamic errors;
  Data? data;

  SmallcaseModel({this.success, this.errors, this.data});

  SmallcaseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errors = json['errors'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Smallcase>? smallcases;

  Data({this.smallcases});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['smallcases'] != null) {
      smallcases = <Smallcase>[];
      json['smallcases'].forEach((v) {
        smallcases!.add(new Smallcase.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.smallcases != null) {
      data['smallcases'] = this.smallcases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
@Collection<Data>('smallcases')
final smallcasesRef = DataCollectionReference(FirebaseFirestore.instance);

class Smallcase {
  String? sId;
  String? rationale;
  String? scid;
  Info? info;
  Stats? stats;
  int? version;
  List<Updates>? updates;
  Benchmark? benchmark;

  Smallcase(
      {this.sId,
      this.rationale,
      this.scid,
      this.info,
      this.stats,
      this.version,
      this.updates,
      this.benchmark});

  Smallcase.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rationale = json['rationale'];
    scid = json['scid'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    version = json['version'];
    if (json['updates'] != null) {
      updates = <Updates>[];
      json['updates'].forEach((v) {
        updates!.add(new Updates.fromJson(v));
      });
    }
    benchmark = json['benchmark'] != null
        ? new Benchmark.fromJson(json['benchmark'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['rationale'] = this.rationale;
    data['scid'] = this.scid;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats!.toJson();
    }
    data['version'] = this.version;
    if (this.updates != null) {
      data['updates'] = this.updates!.map((v) => v.toJson()).toList();
    }
    if (this.benchmark != null) {
      data['benchmark'] = this.benchmark!.toJson();
    }
    return data;
  }
}

class Info {
  String? type;
  String? name;
  String? shortDescription;
  String? created;
  String? nextUpdate;
  String? blogURL;
  String? uploaded;
  String? rebalanceSchedule;
  String? lastRebalanced;
  String? publisherName;
  String? imageUrl;

  Info(
      {this.type,
      this.name,
      this.shortDescription,
      this.created,
      this.nextUpdate,
      this.blogURL,
      this.uploaded,
      this.rebalanceSchedule,
      this.lastRebalanced,
      this.publisherName,
      this.imageUrl});

  Info.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    shortDescription = json['shortDescription'];
    created = json['created'];
    nextUpdate = json['nextUpdate'];
    blogURL = json['blogURL'];
    uploaded = json['uploaded'];
    rebalanceSchedule = json['rebalanceSchedule'];
    lastRebalanced = json['lastRebalanced'];
    publisherName = json['publisherName'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['shortDescription'] = this.shortDescription;
    data['created'] = this.created;
    data['nextUpdate'] = this.nextUpdate;
    data['blogURL'] = this.blogURL;
    data['uploaded'] = this.uploaded;
    data['rebalanceSchedule'] = this.rebalanceSchedule;
    data['lastRebalanced'] = this.lastRebalanced;
    data['publisherName'] = this.publisherName;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}

class Stats {
  Returns? returns;
  double? indexValue;
  double? unadjustedIndex;
  double? lastCloseIndex;
  double? divReturns;
  int? minInvestAmount;
  Ratios? ratios;
  int? minSipAmount;
  bool? minInvestAmountOverridden;
  int? recommendedBuyAmount;
  int? launchDateIndex;
  int? systemCalculatedMIA;
  int? maxNetworth;

  Stats(
      {this.returns,
      this.indexValue,
      this.unadjustedIndex,
      this.lastCloseIndex,
      this.divReturns,
      this.minInvestAmount,
      this.ratios,
      this.minSipAmount,
      this.minInvestAmountOverridden,
      this.recommendedBuyAmount,
      this.launchDateIndex,
      this.systemCalculatedMIA,
      this.maxNetworth});

  Stats.fromJson(Map<String, dynamic> json) {
    returns =
        json['returns'] != null ? new Returns.fromJson(json['returns']) : null;
    indexValue = json['indexValue'];
    unadjustedIndex = json['unadjustedIndex'];
    lastCloseIndex = json['lastCloseIndex'];
    divReturns = double.parse(json['divReturns'].toString());
    minInvestAmount = json['minInvestAmount'];
    ratios =
        json['ratios'] != null ? new Ratios.fromJson(json['ratios']) : null;
    minSipAmount = json['minSipAmount'];
    minInvestAmountOverridden = json['minInvestAmountOverridden'];
    recommendedBuyAmount = json['recommendedBuyAmount'];
    launchDateIndex = json['launchDateIndex'];
    systemCalculatedMIA = json['systemCalculatedMIA'];
    maxNetworth = json['maxNetworth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.returns != null) {
      data['returns'] = this.returns!.toJson();
    }
    data['indexValue'] = this.indexValue;
    data['unadjustedIndex'] = this.unadjustedIndex;
    data['lastCloseIndex'] = this.lastCloseIndex;
    data['divReturns'] = this.divReturns;
    data['minInvestAmount'] = this.minInvestAmount;
    if (this.ratios != null) {
      data['ratios'] = this.ratios!.toJson();
    }
    data['minSipAmount'] = this.minSipAmount;
    data['minInvestAmountOverridden'] = this.minInvestAmountOverridden;
    data['recommendedBuyAmount'] = this.recommendedBuyAmount;
    data['launchDateIndex'] = this.launchDateIndex;
    data['systemCalculatedMIA'] = this.systemCalculatedMIA;
    data['maxNetworth'] = this.maxNetworth;
    return data;
  }
}

class Returns {
  double? daily;
  double? weekly;
  double? monthly;
  double? quarterly;
  double? halfyearly;
  double? yearly;
  double? threeYear;
  double? fiveYear;
  double? sinceInception;
  int? sinceLaunch;

  Returns(
      {this.daily,
      this.weekly,
      this.monthly,
      this.quarterly,
      this.halfyearly,
      this.yearly,
      this.threeYear,
      this.fiveYear,
      this.sinceInception,
      this.sinceLaunch});

  Returns.fromJson(Map<String, dynamic> json) {
    daily = json['daily'];
    weekly = json['weekly'];
    monthly = json['monthly'];
    quarterly = json['quarterly'];
    halfyearly = json['halfyearly'];
    yearly = json['yearly'];
    threeYear = json['threeYear'];
    fiveYear = json['fiveYear'];
    sinceInception = json['sinceInception'];
    sinceLaunch = json['sinceLaunch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['daily'] = this.daily;
    data['weekly'] = this.weekly;
    data['monthly'] = this.monthly;
    data['quarterly'] = this.quarterly;
    data['halfyearly'] = this.halfyearly;
    data['yearly'] = this.yearly;
    data['threeYear'] = this.threeYear;
    data['fiveYear'] = this.fiveYear;
    data['sinceInception'] = this.sinceInception;
    data['sinceLaunch'] = this.sinceLaunch;
    return data;
  }
}

class Ratios {
  double? pe;
  double? pb;
  Null? beta;
  Null? volatility;
  Null? valuation;
  double? peDiscount;
  double? pbDiscount;
  double? divYield;
  double? divYieldDifferential;
  double? d52wHigh;
  double? d52wLow;
  double? largeCapPercentage;
  double? midCapPercentage;
  double? smallCapPercentage;
  String? marketCapCategory;
  double? momentum;
  int? momentumRank;
  double? ema;
  double? lastCloseEma;
  double? risk;
  String? riskLabel;
  double? sharpe;
  double? sharpeRatio;
  double? cagr;
  String? cagrDuration;
  double? cagr1y;
  double? cagr3y;
  double? cagr5y;
  bool? oneYearLiveHistory;

  Ratios(
      {this.pe,
      this.pb,
      this.beta,
      this.volatility,
      this.valuation,
      this.peDiscount,
      this.pbDiscount,
      this.divYield,
      this.divYieldDifferential,
      this.d52wHigh,
      this.d52wLow,
      this.largeCapPercentage,
      this.midCapPercentage,
      this.smallCapPercentage,
      this.marketCapCategory,
      this.momentum,
      this.momentumRank,
      this.ema,
      this.lastCloseEma,
      this.risk,
      this.riskLabel,
      this.sharpe,
      this.sharpeRatio,
      this.cagr,
      this.cagrDuration,
      this.cagr1y,
      this.cagr3y,
      this.cagr5y,
      this.oneYearLiveHistory});

  Ratios.fromJson(Map<String, dynamic> json) {
    pe = json['pe'];
    pb = json['pb'];
    beta = json['beta'];
    volatility = json['volatility'];
    valuation = json['valuation'];
    peDiscount = json['peDiscount'];
    pbDiscount = json['pbDiscount'];
    divYield = double.tryParse( json['divYield'].toString());
    divYieldDifferential = json['divYieldDifferential'];
    d52wHigh = json['52wHigh'];
    d52wLow = json['52wLow'];
    largeCapPercentage = double.tryParse(json['largeCapPercentage'].toString());
    midCapPercentage = double.parse(json['midCapPercentage'].toString());
    smallCapPercentage = double.tryParse(json['smallCapPercentage'].toString());
    marketCapCategory = json['marketCapCategory'];
    momentum = double.tryParse(json['momentum'].toString());
    momentumRank = json['momentumRank'];
    ema = json['ema'];
    lastCloseEma = json['lastCloseEma'];
    risk = double.tryParse(json['risk'].toString());
    riskLabel = json['riskLabel'];
    sharpe = json['sharpe'];
    sharpeRatio = json['sharpeRatio'];
    cagr = json['cagr'];
    cagrDuration = json['cagrDuration'];
    cagr1y = json['cagr1y'];
    cagr3y = json['cagr3y'];
    cagr5y = json['cagr5y'];
    oneYearLiveHistory = json['oneYearLiveHistory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pe'] = this.pe;
    data['pb'] = this.pb;
    data['beta'] = this.beta;
    data['volatility'] = this.volatility;
    data['valuation'] = this.valuation;
    data['peDiscount'] = this.peDiscount;
    data['pbDiscount'] = this.pbDiscount;
    data['divYield'] = this.divYield;
    data['divYieldDifferential'] = this.divYieldDifferential;
    data['52wHigh'] = this.d52wHigh;
    data['52wLow'] = this.d52wLow;
    data['largeCapPercentage'] = this.largeCapPercentage;
    data['midCapPercentage'] = this.midCapPercentage;
    data['smallCapPercentage'] = this.smallCapPercentage;
    data['marketCapCategory'] = this.marketCapCategory;
    data['momentum'] = this.momentum;
    data['momentumRank'] = this.momentumRank;
    data['ema'] = this.ema;
    data['lastCloseEma'] = this.lastCloseEma;
    data['risk'] = this.risk;
    data['riskLabel'] = this.riskLabel;
    data['sharpe'] = this.sharpe;
    data['sharpeRatio'] = this.sharpeRatio;
    data['cagr'] = this.cagr;
    data['cagrDuration'] = this.cagrDuration;
    data['cagr1y'] = this.cagr1y;
    data['cagr3y'] = this.cagr3y;
    data['cagr5y'] = this.cagr5y;
    data['oneYearLiveHistory'] = this.oneYearLiveHistory;
    return data;
  }
}

class Updates {
  String? label;
  String? rationale;
  String? date;
  int? version;
  bool? appliedToUsers;
  bool? appliedToMofsl;
  bool? skipped;

  Updates(
      {this.label,
      this.rationale,
      this.date,
      this.version,
      this.appliedToUsers,
      this.appliedToMofsl,
      this.skipped});

  Updates.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    rationale = json['rationale'];
    date = json['date'];
    version = json['version'];
    appliedToUsers = json['appliedToUsers'];
    appliedToMofsl = json['appliedToMofsl'];
    skipped = json['skipped'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['rationale'] = this.rationale;
    data['date'] = this.date;
    data['version'] = this.version;
    data['appliedToUsers'] = this.appliedToUsers;
    data['appliedToMofsl'] = this.appliedToMofsl;
    data['skipped'] = this.skipped;
    return data;
  }
}

class Benchmark {
  String? id;
  String? message;
  String? index;
  String? msg;
  String? benchmarkLabel;

  Benchmark({this.id, this.message, this.index, this.msg, this.benchmarkLabel});

  Benchmark.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    index = json['index'];
    msg = json['msg'];
    benchmarkLabel = json['benchmarkLabel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['index'] = this.index;
    data['msg'] = this.msg;
    data['benchmarkLabel'] = this.benchmarkLabel;
    return data;
  }
}
