import 'package:flutter/material.dart';

import '../constants.dart';
import 'news_widget.dart';

class NewsCard extends StatelessWidget {
  final String? headline;
  final String? image;
  final String? body;
  final String? author;
  final String? time;
  final String? date;
  final String? url;
  const NewsCard({Key? key,
    required this.headline,
    required this.image,
    required this.body,
    required this.date,
    required this.author,
    required this.time,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsPage(
                    headline: headline,
                    image: image,
                    body: body,
                    date: date,
                    author: author,
                    time: time,
                    url: url)));
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10.0,),
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      image == null ? "https://res.cloudinary.com/dzt6heuso/image/upload/v1653825586/newsImage_oiyu4t.jpg" : image!,
                      fit: BoxFit.cover,
                    )),
              ),
              kSizedBox,
              Text(
                headline == null ? "Can't Find Data" : headline!,
                softWrap: true,
                style: TextStyle(color: Color(0xFF474a6e),fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              kSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("By: ${author == null ? "John Doe" : author!}" ,style: TextStyle(color: Color(0xFF474a6e),fontSize: 14.0,fontWeight: FontWeight.w300)),
                  Text(date == null ? "01/01/1996" : date!,style: TextStyle(color: Color(0xFF474a6e),fontSize: 14.0,fontWeight: FontWeight.w300))
                ],
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }
}
