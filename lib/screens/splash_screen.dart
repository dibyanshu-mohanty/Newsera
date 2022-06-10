import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_news/main.dart';
import 'on_boarding.dart';
import 'home_screen.dart';
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context){
                if (initScreen ==0 || initScreen ==null){
                  return OnBoardScreen();
                } else {
                  return NewsApp();
                }
              }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/Newsera.png",),
          Container(
            width:100,
            child: LinearProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
          Text("Built with ❤ for India",style: TextStyle(color: Color(0xFF474a6e),fontSize: 16.0,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
