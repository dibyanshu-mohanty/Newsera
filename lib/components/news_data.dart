import 'dart:convert';
import 'package:http/http.dart' as http;

final String _apiKey = "42bc402b1adc4c73a70d0baae08eb36e";
class TopData {
    Future<dynamic> getTopData () async{
      http.Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=$_apiKey"));
      if (response.statusCode ==200){
        String data = response.body;
        return(jsonDecode(data));
      } else {
        print(response.statusCode);
      }
    }

    Future<dynamic> getBusData () async{
      http.Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=$_apiKey"));
      if (response.statusCode ==200){
        String data = response.body;
        return(jsonDecode(data));
      } else {
        print(response.statusCode);
      }
    }

    Future<dynamic> getSportData () async{
      http.Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=$_apiKey"));
      if (response.statusCode ==200){
        String data = response.body;
        return(jsonDecode(data));
      } else {
        print(response.statusCode);
      }
    }

    Future<dynamic> getTechData () async{
      http.Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$_apiKey"));
      if (response.statusCode ==200){
        String data = response.body;
        return(jsonDecode(data));
      } else {
        print(response.statusCode);
      }
    }

}
