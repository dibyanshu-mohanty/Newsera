import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_news/constants.dart';
import 'package:in_news/screens/policy.dart';
import 'package:in_news/screens/tech_headline.dart';
import 'business_headline.dart';
import 'sports_headline.dart';
import 'top_headline.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  var reqFunction;

  @override
  void initState() {
    super.initState();
    reqFunction = Headlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Welcome To IN-News",
          style: kAppBarStyle,
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                reqFunction=Headlines();
              });
            },
            icon: Icon(Icons.bubble_chart),
            color: Colors.black,
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black87.withOpacity(0.6),
          child: ListView(
            children: [
              ListTile(
                title: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          image: AssetImage("assets/news_logo.png")),
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.view_headline,
                  color: Colors.white,
                ),
                title: TextButton(
                    onPressed: () {
                      setState(() {
                        reqFunction = Headlines();
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      "Top Headlines",
                      style: kDrawerTextStyle,
                    )),
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.businessTime,
                  color: Colors.white,
                ),
                title: TextButton(
                  onPressed: () {
                    setState(() {
                      reqFunction = BusinessHeadlines();
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Business Headlines",
                    style: kDrawerTextStyle,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.sports,
                  color: Colors.white,
                ),
                title: TextButton(
                  onPressed: () {
                    setState(() {
                      reqFunction = SportsHeadline();
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Sports Headlines",
                    style: kDrawerTextStyle,
                  ),
                ),
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.laptop,
                  color: Colors.white,
                ),
                title: TextButton(
                  onPressed: () {
                    setState(() {
                      reqFunction = TechHeadlines();
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Tech Headlines",
                    style: kDrawerTextStyle,
                  ),
                ),
              ),
              ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
                title: TextButton(
                  onPressed: () {
                    setState(() {
                      reqFunction = Privacy();
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Meet the Creator",
                    style: kDrawerTextStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body:SafeArea(
        child: reqFunction,
      )
    );
  }
}
