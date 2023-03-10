import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hive/hive.dart';
import 'package:wealthaccrue/models/portfolio.dart';
import 'package:wealthaccrue/models/smallcase_model.dart';
import 'package:wealthaccrue/pages/case_details.dart';
import 'package:wealthaccrue/providers/global_providers.dart';
import 'package:wealthaccrue/routers/router.gr.dart';
import '../apis/smallcase_gateway.dart';
import 'package:shimmer/shimmer.dart';

class CaseDisplayPage extends ConsumerStatefulWidget {
  CaseDisplayPage({Key? key}) : super(key: key);

  @override
  _CaseDisplayPageState createState() => _CaseDisplayPageState();
}

class _CaseDisplayPageState extends ConsumerState<CaseDisplayPage> {
  var apiProvider = SmallCaseApi();
  final Dio _dio = Dio();
  Future<Response> dioGet(String url) async {
    final response = await _dio.get(url);
    return response.data;
  }

  Future<void> updateSmallcasesList() async {
    final smallcaseModel = await SmallCaseApi().getSmallcaseModel();
    if (smallcaseModel.success!) {
    print("Updating smallcases list");
      smallcasesRef.doc('all').get().then((documentSnapshot) {
        if (documentSnapshot.exists == false) {
          smallcasesRef.doc('all').set(smallcaseModel.data!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool flag = true;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final _casesStream = FirebaseFirestore.instance.collection('smallcases').doc('all').snapshots();
    updateSmallcasesList();
    final smallcases = ref.watch(smallcaseListProvider);
    final returnsMap = ref.watch(smallcaseReturnsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cases"),
        centerTitle: true,
      ),
      body: FirestoreBuilder<DataDocumentSnapshot>(
        ref: smallcasesRef.doc('all'),
        builder: (context, AsyncSnapshot<DataDocumentSnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong!'));
          }
          if (!snapshot.hasData) {
            return Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              baseColor: Theme.of(context).colorScheme.primaryContainer,
              highlightColor: Theme.of(context).colorScheme.primary,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  );
                },
              ),
            );
          }
          DataDocumentSnapshot documentSnapshot = snapshot.requireData;

          if (!documentSnapshot.exists) {
            return Center(child: Text('Something went wrong!!!'));
          }
          final smallcaseList = documentSnapshot.data!.smallcases;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: smallcaseList!.length,
            itemBuilder: (context, index) {
              // print(smallcaseList);
              final smallcase = smallcaseList.elementAt(index) as Smallcase;
              // print(smallcase);
              return Padding(
                padding:
                    EdgeInsets.only(left: 8.0, right: 8.0, top: 10, bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      elevation: 12,
                      primary: Theme.of(context).colorScheme.primaryContainer,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      fixedSize: Size(width * 0.9, height * 0.145)),
                  onPressed: () {
                    if (flag) {
                      flag = false;
                      // enable click to take user to home screen

                      ref
                          .read(smallcaseProvider.state)
                          .update((state) => smallcase);
                      context.router
                          .push(const CaseDetailsRoute())
                          .then((value) {
                        flag = true;
                      });
                    }
                  },
                  child: Stack(
                    children: [
                      ///
                      ///IMAGE
                      ///

                      Positioned(
                        top: height * 0.01,
                        left: width * 0.016,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: width * 0.2,
                          height: height * 0.1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Colors.grey, BlendMode.darken),
                              child: Image.asset(
                                'images/smallcase-logo.png',
                                // CachedNetworkImageProvider(
                                //     smallcase.info['imageUrl']!),
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///
                      ///NAME
                      ///
                      Positioned(
                        top: height * 0.01,
                        left: width * 0.24,
                        child: Text(
                          smallcase.info!.name.toString(),
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      ///
                      ///DAILY
                      ///
                      Positioned(
                        top: height * 0.08,
                        left: width * 0.72,
                        child: Row(
                          children: [
                            Icon(
                              (smallcase.stats!.returns!.daily! * 100 > 0)
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: (smallcase.stats!.returns!.daily! * 100 > 0)
                                  ? Colors.green[500]
                                  : Colors.red[600],
                              size: 30,
                            ),
                            Text(
                              (smallcase.stats!.returns!.daily! * 100)
                                      .toStringAsFixed(2)
                                      .replaceAll('-', '') +
                                  '%',
                              style: TextStyle(
                                color: (smallcase.stats!.returns!.daily! * 100 > 0)
                                    ? Colors.green[500]
                                    : Colors.red[600],
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///
                      /// YEARS
                      ///
                      Positioned(
                        top: height * 0.07,
                        left: width * 0.24,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  (smallcase.stats!.ratios!.cagrDuration! +
                                      ' CAGR'),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                (smallcase.stats!.ratios!.cagr! * 100)
                                        .toStringAsFixed(2)
                                        .replaceAll('-', '') +
                                    '%',
                                style: TextStyle(
                                    color:
                                        (smallcase.stats!.ratios!.cagr! * 100 > 0)
                                            ? Colors.green[500]
                                            : Colors.red[600],
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),

                      ///
                      ///CAGR
                      ///
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: TypeAheadField<Smallcase>(
//                     textFieldConfiguration: TextFieldConfiguration(
//                         onChanged: (value) {
//                           if (value.isEmpty) {
//                             searchCase = null;
//                           }
//                           if (searchCase != null &&
//                               value != searchCase!.info!.name) {
//                             searchCase = null;
//                           }
//                           setState(() {});
//                         },
//                         controller: searchCaseController,
//                         style: DefaultTextStyle.of(context)
//                             .style
//                             .copyWith(fontStyle: FontStyle.italic),
//                         decoration: InputDecoration(
//                             border: const OutlineInputBorder(),
//                             hintText: "search")),
//                     suggestionsCallback: (pattern) async {
//                       return smallcaseList
//                           .where((Smallcase smallcase) => smallcase
//                               .info!.name!
//                               .toLowerCase()
//                               .startsWith(pattern.toLowerCase()))
//                           .toList();
//                     },
//                     itemBuilder: (context, suggestion) {
//                       return ListTile(
//                         title: Text(suggestion.info!.name!),
//                       );
//                     },
//                     onSuggestionSelected: (suggestion) {
//                       setState(() {});
//                       searchCase = suggestion;
//                       searchCaseController.text = searchCase!.info!.name!;
//                     },
//                   ),
//                 ),
