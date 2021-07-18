import 'package:flutter/material.dart';
import 'package:in_news/components/news_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:in_news/components/news_data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Headlines extends StatefulWidget {
  @override
  _HeadlinesState createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {
  List<String> headline = [];
  List<String> image = [];
  List<String> body = [];
  List<String> author = [];
  List<String> time = [];
  List<String> url = [];
  bool _isLoading = true;

  void getData() async {
    try {
      final data = await TopData().getTopData();
      updateUI(data['articles']);
    } catch (e) {
      print(e);
    }
  }

  void updateUI(dynamic newsData) {
    for (int i = 0; i < newsData.length; i++) {
      setState(() {
        if (newsData == null) {
          Alert(
            context: context,
            type: AlertType.error,
            title: "OOPS !",
            desc: "Something went Wrong",
            buttons: [
              DialogButton(
                child: Text(
                  "Return Back",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              ),
            ],
          );
        }

        headline.add(newsData[i]['title']);
        newsData[i]['urlToImage'] != null
            ? image.add(newsData[i]['urlToImage'])
            : image.add(
                "https://cdn.pixabay.com/photo/2015/03/26/09/47/sky-690293__340.jpg");
        newsData[i]['description'] != null
            ? body.add(newsData[i]['description'])
            : body.add("No Content Found");
        author.add(newsData[i]['source']['name']);
        time.add(newsData[i]['publishedAt']);
        newsData[i]['url'] != null
            ? url.add(newsData[i]['url'])
            : url.add("https://www.google.com");
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> _refresh() async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getData();
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
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
        : RefreshIndicator(
          onRefresh: _refresh,
          child: LiquidSwipe.builder(
              initialPage: 0,
              enableLoop: false,
              itemCount: headline.length,
              itemBuilder: (context, index) => NewsPage(
                headline: headline[index],
                image: image[index],
                body: body[index],
                author: author[index],
                time: time[index],
                url: url[index],
              ),
            ),
        );
  }
}
