// To parse this JSON data, do
//
//     final holdings = holdingsFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
part 'holdings_model.g.dart';

Holdings holdingsFromJson(String str) => Holdings.fromJson(json.decode(str));

String holdingsToJson(Holdings data) => json.encode(data.toJson());

class Holdings {
    Holdings({
        required this.success,
        required this.errors,
        required this.data,
    });

    bool success;
    dynamic errors;
    Data data;

    factory Holdings.fromJson(Map<String, dynamic> json) => Holdings(
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
        required this.smallcases,
        required this.securities,
        required this.updating,
        required this.lastUpdate,
        required this.snapshotDate,
        required this.mutualFunds,
        required this.smallcaseAuthId,
        required this.broker,
    });

    Smallcases smallcases;
    List<Security> securities;
    bool updating;
    DateTime lastUpdate;
    DateTime snapshotDate;
    MutualFunds mutualFunds;
    String smallcaseAuthId;
    String broker;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        smallcases: Smallcases.fromJson(json["smallcases"]),
        securities: List<Security>.from(json["securities"].map((x) => Security.fromJson(x))),
        updating: json["updating"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        snapshotDate: DateTime.parse(json["snapshotDate"]),
        mutualFunds: MutualFunds.fromJson(json["mutualFunds"]),
        smallcaseAuthId: json["smallcaseAuthId"],
        broker: json["broker"],
    );

    Map<String, dynamic> toJson() => {
        "smallcases": smallcases.toJson(),
        "securities": List<dynamic>.from(securities.map((x) => x.toJson())),
        "updating": updating,
        "lastUpdate": lastUpdate.toIso8601String(),
        "snapshotDate": snapshotDate.toIso8601String(),
        "mutualFunds": mutualFunds.toJson(),
        "smallcaseAuthId": smallcaseAuthId,
        "broker": broker,
    };
}

@Collection<Data>('holdings')
final holdingsRef = DataCollectionReference(FirebaseFirestore.instance);

class MutualFunds {
    MutualFunds({
        required this.holdings,
    });

    List<Holding> holdings;

    factory MutualFunds.fromJson(Map<String, dynamic> json) => MutualFunds(
        holdings: List<Holding>.from(json["holdings"].map((x) => Holding.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "holdings": List<dynamic>.from(holdings.map((x) => x.toJson())),
    };
}

class Holding {
    Holding({
        required this.folio,
        required this.fund,
        required this.tradingsymbol,
        required this.pnl,
        required this.quantity,
        required this.isin,
        required this.averagePrice,
        required this.lastPriceDate,
        required this.lastPrice,
        required this.xirr,
    });

    String folio;
    String fund;
    String tradingsymbol;
    int pnl;
    double quantity;
    String isin;
    double averagePrice;
    String lastPriceDate;
    double lastPrice;
    int xirr;

    factory Holding.fromJson(Map<String, dynamic> json) => Holding(
        folio: json["folio"],
        fund: json["fund"],
        tradingsymbol: json["tradingsymbol"],
        pnl: json["pnl"],
        quantity: json["quantity"].toDouble(),
        isin: json["isin"],
        averagePrice: json["averagePrice"].toDouble(),
        lastPriceDate: json["lastPriceDate"],
        lastPrice: json["lastPrice"].toDouble(),
        xirr: json["xirr"],
    );

    Map<String, dynamic> toJson() => {
        "folio": folio,
        "fund": fund,
        "tradingsymbol": tradingsymbol,
        "pnl": pnl,
        "quantity": quantity,
        "isin": isin,
        "averagePrice": averagePrice,
        "lastPriceDate": lastPriceDate,
        "lastPrice": lastPrice,
        "xirr": xirr,
    };
}

class Security {
    Security({
        required this.holdings,
        required this.positions,
        required this.transactableQuantity,
        required this.smallcaseQuantity,
        required this.nseTicker,
        required this.bseTicker,
        required this.isin,
        required this.name,
    });

    HoldingsClass holdings;
    Positions positions;
    int transactableQuantity;
    int smallcaseQuantity;
    String nseTicker;
    String bseTicker;
    String isin;
    String name;

    factory Security.fromJson(Map<String, dynamic> json) => Security(
        holdings: HoldingsClass.fromJson(json["holdings"]),
        positions: Positions.fromJson(json["positions"]),
        transactableQuantity: json["transactableQuantity"],
        smallcaseQuantity: json["smallcaseQuantity"],
        nseTicker: json["nseTicker"],
        bseTicker: json["bseTicker"] == null ? null : json["bseTicker"],
        isin: json["isin"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "holdings": holdings.toJson(),
        "positions": positions.toJson(),
        "transactableQuantity": transactableQuantity,
        "smallcaseQuantity": smallcaseQuantity,
        "nseTicker": nseTicker,
        "bseTicker": bseTicker == null ? null : bseTicker,
        "isin": isin,
        "name": name,
    };
}

class HoldingsClass {
    HoldingsClass({
        required this.quantity,
        required this.averagePrice,
    });

    int quantity;
    double averagePrice;

    factory HoldingsClass.fromJson(Map<String, dynamic> json) => HoldingsClass(
        quantity: json["quantity"],
        averagePrice: json["averagePrice"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "averagePrice": averagePrice,
    };
}

class Positions {
    Positions({
        required this.nse,
        required this.bse,
    });

    HoldingsClass nse;
    HoldingsClass bse;

    factory Positions.fromJson(Map<String, dynamic> json) => Positions(
        nse: HoldingsClass.fromJson(json["nse"]),
        bse: HoldingsClass.fromJson(json["bse"]),
    );

    Map<String, dynamic> toJson() => {
        "nse": nse.toJson(),
        "bse": bse.toJson(),
    };
}

class Smallcases {
    Smallcases({
        required this.public,
        required this.private,
    });

    List<Public> public;
    Private private;

    factory Smallcases.fromJson(Map<String, dynamic> json) => Smallcases(
        public: List<Public>.from(json["public"].map((x) => Public.fromJson(x))),
        private: Private.fromJson(json["private"]),
    );

    Map<String, dynamic> toJson() => {
        "public": List<dynamic>.from(public.map((x) => x.toJson())),
        "private": private.toJson(),
    };
}

class Private {
    Private({
        required this.investments,
    });

    List<dynamic> investments;

    factory Private.fromJson(Map<String, dynamic> json) => Private(
        investments: List<dynamic>.from(json["investments"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "investments": List<dynamic>.from(investments.map((x) => x)),
    };
}

class Public {
    Public({
        required this.scid,
        required this.name,
        required this.investmentDetailsUrl,
        required this.imageUrl,
        required this.stats,
        required this.constituents,
        required this.shortDescription,
    });

    String scid;
    String name;
    String investmentDetailsUrl;
    String imageUrl;
    Stats stats;
    List<Constituent> constituents;
    String shortDescription;

    factory Public.fromJson(Map<String, dynamic> json) => Public(
        scid: json["scid"],
        name: json["name"],
        investmentDetailsUrl: json["investmentDetailsURL"],
        imageUrl: json["imageUrl"],
        stats: Stats.fromJson(json["stats"]),
        constituents: List<Constituent>.from(json["constituents"].map((x) => Constituent.fromJson(x))),
        shortDescription: json["shortDescription"] == null ? null : json["shortDescription"],
    );

    Map<String, dynamic> toJson() => {
        "scid": scid,
        "name": name,
        "investmentDetailsURL": investmentDetailsUrl,
        "imageUrl": imageUrl,
        "stats": stats.toJson(),
        "constituents": List<dynamic>.from(constituents.map((x) => x.toJson())),
        "shortDescription": shortDescription == null ? null : shortDescription,
    };
}

class Constituent {
    Constituent({
        required this.ticker,
        required this.shares,
    });

    String ticker;
    int shares;

    factory Constituent.fromJson(Map<String, dynamic> json) => Constituent(
        ticker: json["ticker"],
        shares: json["shares"],
    );

    Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "shares": shares,
    };
}

class Stats {
    Stats({
        required this.currentValue,
        required this.totalReturns,
        required this.currentReturns,
    });

    double currentValue;
    double totalReturns;
    double currentReturns;

    factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        currentValue: json["currentValue"].toDouble(),
        totalReturns: json["totalReturns"].toDouble(),
        currentReturns: json["currentReturns"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "currentValue": currentValue,
        "totalReturns": totalReturns,
        "currentReturns": currentReturns,
    };
}
