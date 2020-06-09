import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {


  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.black87,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue[900].withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Image.asset(
                  //   "assets/rps_logo.png",
                  //   width: 100,
                  //   height: 100,
                  // ),
                  Text("Ray's", style: TextStyle(color: Colors.white,fontSize: 30) ,),
                  Text("News", style: TextStyle(color: Colors.blue,fontSize: 30)),
                  SizedBox(
                    height: 40,
                  ),
                  Text("News Categories", style: TextStyle(fontSize: 20, color: Colors.white),)
                ],
              )),
          ListTile(
            onTap: (){
            
            },
      
            title: Text(
              "Business News", style: TextStyle(fontSize: 20, color: Colors.white)
            ),
          ),
          Divider(
            height: 1,
            color: Colors.blue[900],
          ),
          ListTile(
            onTap: () {
            },
          
            title: Text("Entertainment",style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          Divider(
            height: 1,
            color: Colors.blue[900],
          ),
          ListTile(
            onTap: () {
            },
            
            title: Text("General News", style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          Divider(
            height: 1,
            color: Colors.blue[900],
          ),
          ListTile(
            onTap: () {},
          
            title: Text("Health", style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          Divider(
            height: 1,
            color: Colors.blue[900],
          ),
          ListTile(
            onTap: () {},
          
            title: Text("Sports", style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          Divider(
            height: 1,
            color: Colors.blue[900],
          ),
          ListTile(
            onTap: () {},
          
            title: Text("Technology", style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

