import 'package:flutter/material.dart';
import 'package:in_news/components/news_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:in_news/components/news_data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Headlines extends StatefulWidget {
  final String category;
  Headlines({required this.category});
  @override
  _HeadlinesState createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {

  bool _isLoading = true;
  var result;
  List finalData =[];

  void getData() async {
    try {
      final data = await TopData().getData(widget.category);
      setState((){
        result = data;
        finalData = result["data"];
        _isLoading =false;
      });
      print(finalData[0]["content"]);
    } catch (e) {
      print(e);
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
        ? Scaffold(
        backgroundColor: Colors.white,
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
        : RefreshIndicator(
          onRefresh: _refresh,
          child: LiquidSwipe.builder(
              initialPage: 0,
              enableLoop: false,
              waveType: WaveType.circularReveal,
              itemCount: result["data"].length,
              itemBuilder: (context, index) => NewsPage(
                date: result["data"][index]["date"],
                headline: result["data"][index]["title"],
                image: result["data"][index]["imageUrl"],
                body: result["data"][index]["content"],
                author: result["data"][index]["author"],
                time: result["data"][index]["time"],
                url: result["data"][index]["readMoreUrl"],
              ),
            ),
        );
  }
}
