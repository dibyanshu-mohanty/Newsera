import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_news/constants.dart';
import 'package:url_launcher/url_launcher.dart' as urk;
import 'package:url_launcher/url_launcher_string.dart';

class NewsPage extends StatelessWidget {
  final String? headline;
  final String? image;
  final String? body;
  final String? author;
  final String? time;
  final String? date;
  final String? url;
  NewsPage({
    required this.headline,
    required this.image,
    required this.body,
    required this.date,
    required this.author,
    required this.time,
    required this.url,
  });

  _launchURL(BuildContext context) async {
    try{
      await urk.launchUrl(Uri.parse(url==null ? "www.google.com" : url!),mode: LaunchMode.inAppWebView);
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please check you internet connection !"),backgroundColor: Colors.redAccent.withOpacity(0.4),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFEEEEEE),
          child: Stack(
            children: [
              Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.8,
                      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Image.network(
                          image == null ? "https://res.cloudinary.com/dzt6heuso/image/upload/v1653825586/newsImage_oiyu4t.jpg" : image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    kSizedBox,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        headline == null ? "Can't Find Data" : headline!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                      child: Text(
                        "🗓  ${date == null ? "01/01/1996" : date!} - ⌚ " + time!,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            letterSpacing: 1.0),
                      ),
                    ),
                    kSizedBox,
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        body == null ? "Can't Find Data" : body!,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w300,
                            fontSize: 14.0,
                            fontFamily: "Lato",
                            letterSpacing: 0.5),
                      ),
                    ),
                  ]),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    color: Colors.black12,
                  ),
                  width: MediaQuery.of(context).size.width,
                  // height: (MediaQuery.of(context).size.height)*0.3,
                  child: GestureDetector(
                    onTap: () {
                      _launchURL(context);
                    },
                    child: Center(
                      child: Text(
                        "Tap Here to Read More",
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
