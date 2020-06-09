import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:news_app/models/customDrawer.dart';
import 'package:news_app/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
        
      
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Explore(),

    );
  }
}
class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  FSBStatus status;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: FoldableSidebarBuilder(
         drawerBackgroundColor: Colors.blue[900],
         status: status, drawer: CustomDrawer(
         closeDrawer: (){
           setState(() {
             status = FSBStatus.FSB_CLOSE;
           });
         },
       ), screenContents: Home()),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
        status = status == FSBStatus.FSB_OPEN?FSBStatus.FSB_CLOSE:FSBStatus.FSB_OPEN;
      });
      },
      backgroundColor: Colors.blue[900],
      child: Icon(Icons.menu, color: Colors.black,),),

      ),
      );
  } 
}

