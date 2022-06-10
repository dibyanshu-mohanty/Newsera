import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_news/screens/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
class OnBoardScreen extends StatelessWidget {

  Widget _buildImage(String imageName) {
    return Image.asset('assets/$imageName', width: 350);
  }

  void goToHome(context) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NewsApp()));

  DotsDecorator getDotDecoration () {
    return DotsDecorator(
      size: Size.square(9.0),
      activeSize: Size(18,9),
      activeColor: Colors.black,
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
            title: 'Welcome to Newsera!',
            body: 'Get Great News on your Fingertips',
            image: _buildImage("Onboarding1.png"),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  fontSize: 28.0, fontWeight: FontWeight.w700,fontFamily: 'Montserrat'),
              bodyTextStyle: TextStyle(fontSize: 20.0),
              imagePadding: EdgeInsets.all(24.0),
            )
        ),
        PageViewModel(
            title: 'Get Appropriate and Authentic news',
            body: 'National, Business, Sports, Tech, Startups. We got them all ',
            image: _buildImage("Onboarding2.png"),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat'
              ),
              bodyTextStyle: TextStyle(fontSize: 20.0),
              imagePadding: EdgeInsets.all(24.0),
            )
        ),
        PageViewModel(
            title: 'Get news of your choice in just one click !',
            body: 'Thank you for choosing Newsera. We hop you enjoy your experience here !',
            image: _buildImage("Onboarding3.png"),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  fontSize: 28.0, fontWeight: FontWeight.w700,fontFamily: 'Montserrat'),
              bodyTextStyle: TextStyle(fontSize: 20.0),
              imagePadding: EdgeInsets.all(24.0),
            )
        ),
      ],
      done: Text('Done', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
      onDone: () {
        goToHome(context);
      },
      onSkip: () { goToHome(context); },
      skip: Text("Skip", style: TextStyle(color: Colors.black),),
      next: Icon(CupertinoIcons.forward, color: Colors.black,),
      showSkipButton: true,
      showNextButton: true,
      dotsDecorator: getDotDecoration(),
    );
  }
}
