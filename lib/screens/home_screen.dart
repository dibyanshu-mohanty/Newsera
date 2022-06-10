import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_news/components/news_data.dart';
import 'package:in_news/components/news_tile.dart';
import 'package:in_news/constants.dart';
import 'package:in_news/screens/policy.dart';
import 'package:in_news/screens/tech_headline.dart';
import '../components/news_card.dart';
import 'business_headline.dart';
import 'sports_headline.dart';
import 'top_headline.dart';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  int defaultChoiceIndex = 0;
  List<Map<String, String>> _choicesList = [
    {'title': 'Latest', 'id': 'national'},
    {'title': 'World', 'id': 'world'},
    {'title': 'Business', 'id': 'business'},
    {'title': 'Sports', 'id': 'sports'},
    {'title': 'Startups', 'id': 'startup'},
    {'title': 'Politics', 'id': 'politics'},
    {'title': 'Entertainment', 'id': 'entertainment'},
    {'title': 'Technology', 'id': 'technology'}
  ];
  ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  bool? isLoading;
  var result;
  List finalData = [];

  void getData() async {
    try {
      isLoading = true;
      final data =
          await TopData().getData(_choicesList[defaultChoiceIndex]["id"]!);
      setState(() {
        result = data;
        finalData = result["data"];
        _isLoading = false;
        isLoading = false;
      });
      finalData.sort((a, b) => b["date"].compareTo(a["date"]));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitRotatingCircle(
                    size: 20.0,
                    color: Colors.black,
                  ),
                  Text(
                    "Loading News",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Privacy()));
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/Newsera.png"),
                      radius: 20.0,
                    ),
                  ),
                ]),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () {
                  getData();
                  return Future.delayed(Duration(seconds: 5));
                },
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Breaking News",
                        style: TextStyle(
                            color: Color(0xFF474a6e),
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Galano",
                            letterSpacing: 0.6),
                      ),
                    ),
                    NewsCard(
                      date: finalData[0]["date"],
                      headline: finalData[0]["title"],
                      image: finalData[0]["imageUrl"],
                      body: finalData[0]["content"],
                      author: finalData[0]["author"],
                      time: finalData[0]["time"],
                      url: finalData[0]["readMoreUrl"],
                    ),
                    skSizedBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "News Just For You",
                        style: TextStyle(
                            color: Color(0xFF474a6e),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Galano",
                            letterSpacing: 0.2),
                      ),
                    ),
                    skSizedBox,
                    Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(_choicesList.length, (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: ChoiceChip(
                                labelPadding: EdgeInsets.symmetric(
                                    horizontal: 5.0, vertical: 2.0),
                                label: Text(
                                  _choicesList[index]["title"]!,
                                  style: TextStyle(
                                      color: Color(0xFF474c72),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200),
                                ),
                                selected: defaultChoiceIndex == index,
                                selectedColor:
                                    Color(0xFF5180be).withOpacity(0.55),
                                disabledColor: Colors.white60,
                                onSelected: (value) {
                                  setState(() {
                                    defaultChoiceIndex =
                                        value ? index : defaultChoiceIndex;
                                  });
                                  getData();
                                  //print(_choicesList[defaultChoiceIndex]);
                                },
                                // backgroundColor: color,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(horizontal: 6),
                              ),
                            );
                          }),
                        )),
                    skSizedBox,
                    isLoading!
                        ? Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SpinKitRotatingCircle(
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Loading News",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Scrollbar(
                            controller: _scrollController,
                            thumbVisibility: true,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.68,
                              child: ListView(
                                controller: _scrollController,
                                children:
                                    List.generate(finalData.length, (index) {
                                  return NewsTile(
                                    date: finalData[index]["date"],
                                    headline: finalData[index]["title"],
                                    image: finalData[index]["imageUrl"],
                                    body: finalData[index]["content"],
                                    author: finalData[index]["author"],
                                    time: finalData[index]["time"],
                                    url: finalData[index]["readMoreUrl"],
                                  );
                                }),
                              ),
                            ),
                          ),
                    // Headlines(newsFunction: TopData().getData,),
                  ],
                ),
              ),
            ),
          );
  }
}
