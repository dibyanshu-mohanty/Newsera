// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:in_news/components/news_data.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:in_news/components/news_widget.dart';
//
// class SportsHeadline extends StatefulWidget {
//   @override
//   _SportsHeadlineState createState() => _SportsHeadlineState();
// }
//
// class _SportsHeadlineState extends State<SportsHeadline> {
//
//   var result;
//
//   void getNewsData() async{
//     final response = await TopData().getData();
//     setState((){
//       result = response;
//     });
//     print(result["data"][0]["content"]);
//   }
//   @override
//   void initState() {
//     super.initState();
//     getNewsData();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Loading News",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontFamily: "Montserrat",
//                     fontSize: 18.0,
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }
//
