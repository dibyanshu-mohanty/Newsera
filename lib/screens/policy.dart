import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_news/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Center(
                child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      "assets/Newsera.png",
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.6,
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                  ),
                  Column(
                    children: [
                      Text(
                        "Creator",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "The app is owned and managed by DevCrew.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        wordSpacing: 1.0,
                        fontFamily: "Montserrat",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Column(
                    children: [
                      Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "All the information used in the app is received from the External server."
                    "Thus in case of any runtime issues, please write to us at devcrewcommunity@gmail.com\n"
                    "This app doesn't promote or endorse the use of any third-party ads. "
                    "Thus preventing user data leak by cookies."
                        " This app is built upon an unofficial Inshorts Server. So kudos & credits to the developer and Inshorts(ofc the best :))",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        wordSpacing: 1.0,
                        fontFamily: "Montserrat",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  skSizedBox,
                  Column(
                    children: [
                      Text(
                        "Connect with the Creator",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      String url =
                          "https://www.linkedin.com/in/dibyanshu-m-37a2b71b8/";
                        try{
                          await launchUrl(Uri.parse(url),mode: LaunchMode.inAppWebView);
                        }
                        catch (e){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please check you internet connection !"),backgroundColor: Colors.redAccent.withOpacity(0.4),));
                      }
                    },
                    icon: FaIcon(FontAwesomeIcons.linkedin),
                  ),
                  Text("Built with ❤ for India"),
                  Text("© 2022, All Rights Reserved.")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
