import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:json_annotation/json_annotation.dart';
  import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:wealthaccrue/models/portfolio.dart';
import 'package:wealthaccrue/models/returns_model.dart' hide Data;
import 'holdings_model.dart';

// This doesn't exist yet...! See "Next Steps"
part 'investor.g.dart';

@JsonSerializable(explicitToJson: true)
class Investor {
  Investor(
      {this.name,
      this.email,
      this.phone,
      this.dob,
      this.uid,
      this.lockPin,
      this.isFingerprintAuthenticated = false,
      this.isDarkTheme
      }) {
    // Apply the validator
    // _$assertInvestor(this);
  }
  factory Investor.fromJson(Map<String, Object?> json) =>
      _$InvestorFromJson(json);
  final String? uid;
  final String? name;
  final String? email;
  final String? phone;
  final String? dob;
  final String? lockPin;
  final bool? isFingerprintAuthenticated;
  final bool? isDarkTheme;

  // Apply the `Min` validator

  Map<String, Object?> toJson() => _$InvestorToJson(this);
}

@Collection<Investor>('investors')
@Collection<Data>('investors/*/holdings')
@Collection<Portfolio>('investors/*/portfolios')
final investorsRef = InvestorCollectionReference(FirebaseFirestore.instance);
