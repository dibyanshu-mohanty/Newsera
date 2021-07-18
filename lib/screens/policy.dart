import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
            "The app is owned and managed by Dibyanshu Mohanty.",
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
            "There is no explicit usage of the user data involved in this app."
            "In case of any discrepancy or inaccurate usage of some particular data, "
            "Feel free to contact us.\n"
            "All the information used in the app is received from the NEWS-API.org server."
            "Thus in case of any runtime issues, the owner is not solely responsible for the"
                "inconvenience caused.\n"
            "This app doesn't promote or endorse the use of any third-party ads"
                "and is not responsible for any third-party cookie usage.",
            textAlign: TextAlign.center,
            style: TextStyle(
                wordSpacing: 1.0,
                fontFamily: "Montserrat",
                fontSize: 14.0,
                fontWeight: FontWeight.w400) ,
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async{
                    String url = "https://github.com/dibyanshu-mohanty";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.github),
              ),
              IconButton(
                onPressed: () async{
                  String url = "https://www.linkedin.com/in/dibyanshu-mohanty-37a2b71b8/";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                icon: FaIcon(FontAwesomeIcons.linkedin),
              ),
            ],
          ),
          Text(
            "© 2021, All Rights Reserved."
          )
        ],
      ),
    );
  }
}
