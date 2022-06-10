import 'dart:convert';
import 'package:http/http.dart' as http;
import '../secrets.dart';


class TopData {
  Future<dynamic> getData(String category) async{
    http.Response response = await http.get(Uri.parse("https://inshorts.deta.dev/news?category=$category"));
    return(jsonDecode(response.body));
  }
}
