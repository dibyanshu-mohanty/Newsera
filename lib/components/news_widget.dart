import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  final String headline;
  final String image;
  final String body;
  final String author;
  final String time;
  final String url;
  NewsPage({
    required this.headline,
    required this.image,
    required this.body,
    required this.author,
    required this.time,
    required this.url,
  });

  _launchURL(BuildContext context) async {
    try{
      await launch(url);
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please check you internet connection !")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      color: Color(0xFFEEEEEE),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0,bottom: 5.0),
              child: Text(
                headline,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  fontFamily: "Nunito",
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: Text(
                time,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                    letterSpacing: 1.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              child: Text(
                body,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    fontFamily: "Lato",
                    letterSpacing: 0.5),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Source: " + author,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      _launchURL(context);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.externalLinkAlt,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Read More",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(15.0),
            //         topRight: Radius.circular(15.0)),
            //     color: Color(0xFFDDDDDD),
            //   ),
            //   width: MediaQuery.of(context).size.width,
            //   // height: (MediaQuery.of(context).size.height)*0.3,
            //   child: GestureDetector(
            //     onTap: () {
            //       _launchURL();
            //     },
            //     child: Center(
            //       child: Text(
            //             "Tap Here to Read More!",
            //             style: TextStyle(
            //                 color: Colors.black87,
            //                 fontFamily: "Montserrat",
            //                 fontWeight: FontWeight.w500),
            //           ),
            //     ),
            //   ),
            // ),
          ]),
    );
  }
}
