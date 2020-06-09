import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=ng&apiKey=ef2b3eb7b45e4f109796695cc7d60df1";
  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);
    if (jsonData['status']== 'ok'){
      jsonData["articles"].forEach((element){
            if(element["urlToImage"] !=null && element['description'] !=null){
              ArticleModel articleModel= ArticleModel(
                title: element['title'],
                author: element['author'],
                description: element['description'],
                url: element['url'],
                urlToImage:element["urlToImage"],
               // publishedAt: element["publishedAt"],
                content: element["context"]


              );

              news.add(articleModel);
            }
      });

    }
  }
}