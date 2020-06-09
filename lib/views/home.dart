import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';

import 'article_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

List<CategoryModel> categories = new List<CategoryModel>();  
List<ArticleModel> articles = new List<ArticleModel>();
bool _loading = true;
 @override
  void initState(){
    super.initState();
    categories = getCategories();
    getNews(); 
  }

  getNews()async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Ray's", style: TextStyle(color: Colors.white) ,),
        Text("News", style: TextStyle(color: Colors.blue)),
        ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: _loading ? Center(
                  child: Container(
           child: SpinKitFadingFour(color: Colors.blue[900],size: 40.0),
         ),
      )    
      :SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
            //categories
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 70,
          child: ListView.builder
          (itemCount: categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return CategoryTile(
                imageUrl: categories[index].imageUrl,
                categoryName: categories[index].categoryName,

            );
          }),
        ),
        //blogs
        Container(
          child: ListView.builder(
            itemCount: articles.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context ,index){
              return Blogtile(
                imageUrl: articles[index].urlToImage,
                title: articles[index].title,
                desc: articles[index].description,
                url: articles[index].url,
                
                );
            })
        )

          ],),

        ),
      ) ,
    );
    
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){},
  
    child: Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
           child:CachedNetworkImage(
             imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover,),
       
          ),
             Container(
               alignment: Alignment.center,
               width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black26
                ),

              
            child: Text(categoryName, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
            
            )
          )
        ],
      ),
    )
    );
  }
}

class Blogtile extends StatelessWidget {
  final String imageUrl, title, desc,url;
  Blogtile ({@required this.imageUrl,@required this.title, @required this.desc,@required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(
        blogUrl: url,
        )   
        ));
      },
          child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget> [
            ClipRRect(
              borderRadius:BorderRadius.circular(6),
              child: Image.network(imageUrl)
              ),
             SizedBox(height:8,),
            Text(title ,style: TextStyle(color: Colors.white,fontSize: 18,
            fontWeight: FontWeight.w500),),
             SizedBox(height:8,
             
             ),
             Text(desc,style: TextStyle(color: Colors.white70),),
          ]
        ),
      ),
    );
  }
}