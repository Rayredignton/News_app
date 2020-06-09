import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticleView extends StatefulWidget {
    final String blogUrl;
  ArticleView({
              this.blogUrl
  });
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer = 
  Completer<WebViewController>();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Ray's", style: TextStyle(color: Colors.white) ,),
        Text("News", style: TextStyle(color: Colors.blue)),
        ],
        ),
        actions: <Widget>[
        Container(
          //paddng: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.save))
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
      child: WebView(
        initialUrl: widget.blogUrl,
        onWebViewCreated: (WebViewController webViewController){
          _completer.complete(webViewController);
        },
      ),
      ),
    );
  }
}