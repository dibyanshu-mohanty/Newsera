import 'package:flutter/material.dart';
import 'package:in_news/components/news_widget.dart';

class NewsTile extends StatelessWidget {
  final String? headline;
  final String? image;
  final String? body;
  final String? author;
  final String? time;
  final String? date;
  final String? url;
  const NewsTile({
    Key? key,
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
        margin: EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.0),
          child: ListTile(
            leading: Container(
              width: 80,
              height: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage(
                    image: NetworkImage(image == null
                        ? "https://res.cloudinary.com/dzt6heuso/image/upload/v1653825586/newsImage_oiyu4t.jpg"
                        : image!),
                    placeholder: AssetImage("assets/news.jpg"),
                  )),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                headline == null ? "Can't Find Data" : headline!,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Color(0xFF474a6e)),
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "🗓 ${date == null ? "01/01/1996" : date!}",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Color(0xFF474a6e)),
                ),
                Text(
                  "⌚ ${time == null ? "00:00 am" : time!}",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Color(0xFF474a6e)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
