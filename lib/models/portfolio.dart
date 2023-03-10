import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/models/returns_model.dart' hide Data;
import 'holdings_model.dart';

// This doesn't exist yet...! See "Next Steps"
part 'portfolio.g.dart';

@JsonSerializable(explicitToJson: true)
class Portfolio {
  Portfolio({
    this.values,
  }) {
    // Apply the validator
    // _$assertPortfolio(this);
  }
  factory Portfolio.fromJson(Map<String, Object?> json) =>
      _$PortfolioFromJson(json);
  // final String? date;
  // final double? value;
  Map<String, String> ? values;

  // Apply the `Min` validator

  Map<String, Object?> toJson() => _$PortfolioToJson(this);
}

@Collection<Portfolio>('portfolios')
final portfoliosRef = PortfolioCollectionReference(FirebaseFirestore.instance);
