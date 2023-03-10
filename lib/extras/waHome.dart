// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// class WAHomeScreen extends StatefulWidget {
//   const WAHomeScreen({Key? key}) : super(key: key);

//   @override
//   State<WAHomeScreen> createState() => _WAHomeScreenState();
// }

// class _WAHomeScreenState extends State<WAHomeScreen>
//     with TickerProviderStateMixin {
//   List images = [
//     'images/goals.png',
//     'images/retirement_planning.png',
//     'images/portfolio-lifecycle.jpg',
//     'images/invest.webp',
//   ];
//   List image_titles = [
//     'Goal Based Investing',
//     'Retirement Planning',
//     'Portfolio Management',
//     'Ready Made Portfolios',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           const SliverAppBar(
//             stretch: true,
//             shadowColor: Colors.purple,
//             elevation: 10,
//             floating: true,
//             expandedHeight: 200.0,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text('WealthAccrue'),
//               centerTitle: true,
//               expandedTitleScale: 2,
//             ),
//             backgroundColor: Colors.purple,
//           ),
//           AnimationLimiter(
//             child: SliverList(
//               delegate: SliverChildBuilderDelegate((context, index) {
//                 return AnimationConfiguration.staggeredList(
//                   position: index,
//                   duration: const Duration(milliseconds: 2000),
//                   child: SlideAnimation(
//                     verticalOffset: 50.0,
//                     child: FadeInAnimation(
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Card(
//                               margin: const EdgeInsets.all(15),
//                               clipBehavior: Clip.antiAliasWithSaveLayer,
//                               color: Colors.purple[100],
//                               elevation: 8,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(100),
//                               ),
//                               child: Stack(
//                                 children: <Widget>[
//                                   Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsetsDirectional
//                                             .fromSTEB(0, 0, 0, 0),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(100),
//                                           child: Image.asset(
//                                             images[index],
//                                             width: 200,
//                                             height: 150,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         // fit: FlexFit.tight,
//                                         flex: 1,
//                                         child: Text(
//                                           image_titles[index],
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             fontSize: 25,
//                                             color: Colors.purple[800],
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Positioned.fill(
//                                       child: Material(
//                                     color: Colors.transparent,
//                                     child: InkWell(
//                                       splashColor: Colors.purple[100],
//                                       onTap: () {},
//                                     ),
//                                   ))
//                                 ],
//                               )),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }, childCount: 4),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
