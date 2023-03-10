// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart';
// import 'package:wealthaccrue/fund_details.dart';
// import 'package:wealthaccrue/mutual_fund_model.dart';
// import 'package:wealthaccrue/services/api_service.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:truncate/truncate.dart';
// import 'page_route_animations.dart';

// class PortfolioScreen extends StatefulWidget {
//   const PortfolioScreen({Key? key}) : super(key: key);
//   @override
//   State<PortfolioScreen> createState() => _PortfolioScreenState();
// }

// class _PortfolioScreenState extends State<PortfolioScreen> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[100],
//       body: FutureBuilder(
//           future: ApiService().getMutualFund(),
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               return AnimationLimiter(
//                   child: ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (context, index) {
//                   FundModel fund = welcomeFromJson(snapshot.data[index]);
//                   return AnimationConfiguration.staggeredList(
//                       position: index,
//                       duration: const Duration(milliseconds: 1000),
//                       child: SlideAnimation(
//                           verticalOffset: 50.0,
//                           child: FadeInAnimation(
//                             child: Card(
//                               // clipBehavior: Clip.antiAliasWithSaveLayer,
//                               margin: const EdgeInsets.all(10),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15)),
//                               elevation: 0,
//                               child: InkWell(
//                                 splashColor: Colors.grey,
//                                 borderRadius: BorderRadius.circular(15),
//                                 onTap: () {
//                                   Navigator.of(context).push(SlidePageRoute(
//                                       page: FundPerformanceScreen(
//                                     chartData: fund.data,
//                                   )));
//                                 },
//                                 child: Container(
//                                   padding: const EdgeInsets.all(10),
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.5,
//                                   height:
//                                       MediaQuery.of(context).size.height / 6,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: <Widget>[
//                                       Text(
//                                         fund.meta.schemeName,
//                                         style: GoogleFonts.robotoSlab(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.deepPurple),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.end  ,
//                                         children: <Widget>[
//                                           Text(
//                                             "NAV: ",
//                                             style: GoogleFonts.robotoSlab(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           Text(
//                                             fund.data[0].nav.toString(),
//                                             style: GoogleFonts.robotoSlab(
//                                               color: Colors.blueAccent,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )));
//                 },
//               ));
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator.adaptive(),
//               );
//             }
//           }),
//     );
//   }
// }
