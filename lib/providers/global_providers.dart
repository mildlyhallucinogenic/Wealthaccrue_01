import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:wealthaccrue/apis/smallcase_gateway.dart';
import 'package:wealthaccrue/models/holdings_model.dart';
import 'package:wealthaccrue/models/investor.dart';
import 'package:wealthaccrue/models/returns_model.dart' hide Smallcase;
import 'package:wealthaccrue/models/smallcase_model.dart' hide Returns;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scgateway_flutter_plugin/scgateway_flutter_plugin.dart';

final firstNameStateProvider = StateProvider<String>((ref) => '');
final lastNameStateProvider = StateProvider<String>((ref) => '');
final dobStateProvider = StateProvider<String>((ref) => '');
final phoneNumberStateProvider = StateProvider<String>((ref) => '');
final emailStateProvider = StateProvider<String>(
  (ref) => '',
);



final lockPinStateProvider = StateProvider<String>(
  (ref) => '',
);
final smallcaseListProvider = FutureProvider<List<Smallcase>>((ref) async {
  return SmallCaseApi().getAllSmallcases();
});

final holdingsDataProvider = FutureProvider<Holdings>((ref) async {
  return SmallCaseApi().getUserHoldings();
});

final userProvider = Provider<User?>(
  (ref) {
    return FirebaseAuth.instance.currentUser;
  },
);

final smallcaseProvider = StateProvider<Smallcase?>(
  (ref) {
    return null;
  },
);

final investorProvider = StateProvider<Investor?>(
  (ref) {
    return null;
  },
);

final smallcaseReturnsProvider =
    FutureProvider<Map<String, Map<String, Returns>>>((ref) async {
  final smallcaseList = ref.watch(smallcaseListProvider).value;
  Map<String, Returns> tempMap = Map<String, Returns>();
  final returnsMap = Map<String, Map<String, Returns>>();
  // print("cjxnjciodsjcfijsiofjioswdfj");
  (smallcaseList!).forEach((smallcase) async {
    print("object");
    tempMap[smallcase.scid!] = await SmallCaseApi().getHistoricalReturns(
        smallcase.scid!.toString(), smallcase.benchmark!.id.toString(), "max");
    returnsMap[smallcase.scid!] = Map<String, Returns>();
    tempMap[smallcase.scid!]!.data.durations.forEach((duration) async {
      returnsMap[smallcase.scid!]![duration] = await SmallCaseApi()
          .getHistoricalReturns(smallcase.scid!.toString(),
              smallcase.benchmark!.id.toString(), duration);
    });
    print(tempMap[smallcase.scid!]);
  });
  return returnsMap;
});

final themeModeProvider = FutureProvider<ThemeMode?>(
  (ref) async {
    ThemeMode? themeMode;
    await investorsRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (value.data != null && value.data!.isDarkTheme != null) {
        // print(value.data!.isDarkTheme);
        if (value.data!.isDarkTheme == true) {
          themeMode = ThemeMode.dark;
          // print(theme.name);
        } else if (value.data!.isDarkTheme == false) {
          // print("Light theme -- ThemeProvider");
          themeMode = ThemeMode.light;
        }
      }
    });
    return themeMode;
  },
);


// final smallcaseDbProvider = FutureProvider<List<SmallcaseDb>>(
//   (ref) async {
//     AsyncValue<List<Smallcase>> smallcaseList =
//         ref.watch(smallcaseListProvider);

//     List<SmallcaseDb> dbList = [];
//     (smallcaseList as List<Smallcase>).forEach(
//       (smallcase) {
//         dbList.add(
//           SmallcaseDb(
//               idno: smallcase.id,
//               scid: smallcase.scid!,
//               name: smallcase.info['name']!,
//               version: smallcase.version,
//               shortDescription: smallcase.info['shortDescription']!,
//               type: smallcase.info['type']!,
//               publisherName: smallcase.info['publisherName']!,
//               rebalanceSchedule: smallcase.info['rebalanceSchedule']!,
//               lastRebalanced: smallcase.info['lastRebalanced'].toString(),
//               imageUrl: smallcase.info['imageUrl']!,
//               daily: smallcase.stats.returns.daily.toDouble(),
//               weekly: smallcase.stats.returns.weekly,
//               monthly: smallcase.stats.returns.monthly,
//               quarterly: smallcase.stats.returns.quarterly,
//               halfyearly: smallcase.stats.returns.halfyearly,
//               yearly: smallcase.stats.returns.yearly,
//               threeYear: smallcase.stats.returns.threeYear,
//               fiveYear: smallcase.stats.returns.fiveYear,
//               sinceInception: smallcase.stats.returns.sinceInception,
//               minInvestAmount: smallcase.stats.minInvestAmount,
//               divYield: smallcase.stats.ratios.divYield,
//               smallCapPercentage: smallcase.stats.ratios.smallCapPercentage,
//               midCapPercentage: smallcase.stats.ratios.midCapPercentage,
//               largeCapPercentage: smallcase.stats.ratios.largeCapPercentage,
//               sharpeRatio: smallcase.stats.ratios.sharpeRatio,
//               cagr: smallcase.stats.ratios.cagr,
//               pe: smallcase.stats.ratios.pe,
//               riskLabel: smallcase.stats.ratios.riskLabel,
//               minSipAmount: smallcase.stats.minSipAmount,
//               benchmarkId: smallcase.benchmark.id,
//               benchamarkIndex: smallcase.benchmark.index,
//               benchmarkLabel: smallcase.benchmark.benchmarkLabel),
//         );
//       },
//     );
//     return dbList;
//   },
// );
